import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history_repository.dart';

final vaccineHistoryRepoProvider = Provider<VaccineHistoryRepository>((ref) {
  throw UnimplementedError('Provide VaccineHistoryRepository via VaccineHistoryRepoProvider');
});

class VaccineHistoryController extends AsyncNotifier<List<VaccineHistory>> {
  late final VaccineHistoryRepository _repo;

  @override
  Future<List<VaccineHistory>> build() async {
    _repo = ref.read(vaccineHistoryRepoProvider);
    return _repo.list();
  }

  Future<void> upsert(VaccineHistory input) async {
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

final vaccineHistoryControllerProvider =
AsyncNotifierProvider<VaccineHistoryController, List<VaccineHistory>>(() => VaccineHistoryController());
