import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/pets/domain/pet.dart';
import 'package:pet_care_mobile/features/pets/domain/pet_repository.dart';
import 'package:pet_care_mobile/features/pets/infra/providers/pet_repo_provider.dart';

class PetsController extends AsyncNotifier<List<Pet>> {
  late final PetRepository _repo;

  @override
  Future<List<Pet>> build() async {
    _repo = ref.read(petRepositoryProvider);
    return _repo.list();
  }

  Future<void> upsert(Pet input) async {
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
      // 保存後の確定反映（IDが変わるケースも想定）
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

final petsControllerProvider =
AsyncNotifierProvider<PetsController, List<Pet>>(() => PetsController());
