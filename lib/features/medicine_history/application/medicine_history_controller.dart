import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history_repository.dart';

final medicineHistoryRepoProvider = Provider<MedicineHistoryRepository>((ref) {
  throw UnimplementedError('Provide MedicineHistoryRepository via MedicineHistoryRepoProvider');
});

class MedicineHistoryController extends AsyncNotifier<List<MedicineHistory>> {
  late final MedicineHistoryRepository _repo;

  @override
  Future<List<MedicineHistory>> build() async {
    _repo = ref.read(medicineHistoryRepoProvider);
    return _repo.list();
  }

  Future<void> upsert(MedicineHistory input) async {
    final prev = state;
    state = state.whenData((items) {
      final idx = items.indexWhere((e) => e.localId == input.localId);
      if (idx == -1) {
        return [...items, input];
      } else {
        final copy = [...items];
        copy[idx] = input;
        return copy;
      }
    });

    try {
      final saved = await _repo.upsert(input);
      state = state.whenData((items) {
        final idx = items.indexWhere((e) => e.localId == input.localId);
        if (idx == -1) {
          return [...items, saved];
        } else {
          final copy = [...items];
          copy[idx] = saved;
          return copy;
        }
      });
    } catch (e, st) {
      state = prev;
      state = AsyncError(e, st);
    }
  }

  Future<void> remove(String idOrLocal) async {
    final prev = state;
    state = state.whenData((items) => items.where((e) => e.localId != idOrLocal).toList());
    try {
      await _repo.remove(idOrLocal);
    } catch (e, st) {
      state = prev;
      state = AsyncError(e, st);
    }
  }

  Future<void> refreshList() async {
    state = const AsyncLoading();
    try {
      final data = await _repo.list();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final medicineHistoryControllerProvider =
AsyncNotifierProvider<MedicineHistoryController, List<MedicineHistory>>(() => MedicineHistoryController());
