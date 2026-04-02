import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/hospitals/domain/hospital.dart';
import 'package:pet_care_mobile/features/hospitals/domain/hospital_repository.dart';
import 'package:pet_care_mobile/features/hospitals/infra/providers/hospital_repo_provider.dart';

class HospitalController extends AsyncNotifier<List<Hospital>> {
  late final HospitalRepository _repo;

  @override
  Future<List<Hospital>> build() async {
    _repo = ref.read(hospitalRepositoryProvider);
    return _repo.list();
  }

  Future<void> upsert(Hospital input) async {
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

final hospitalControllerProvider =
AsyncNotifierProvider<HospitalController, List<Hospital>>(() => HospitalController());
