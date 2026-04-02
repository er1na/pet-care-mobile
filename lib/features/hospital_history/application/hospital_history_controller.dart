import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history_repository.dart';
import 'package:pet_care_mobile/features/hospital_history/infra/providers/hospital_history_repo_provider.dart';

class HospitalHistoryController extends AsyncNotifier<List<HospitalHistory>> {
  late final HospitalHistoryRepository _repo;

  @override
  Future<List<HospitalHistory>> build() async {
    _repo = ref.read(hospitalHistoryRepositoryProvider);
    return _repo.list();
  }

  Future<void> upsert(HospitalHistory input) async {
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

final hospitalHistoryControllerProvider =
AsyncNotifierProvider<HospitalHistoryController, List<HospitalHistory>>(() => HospitalHistoryController());
