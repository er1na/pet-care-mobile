import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary_repository.dart';

final petDiaryRepoProvider = Provider<PetDiaryRepository>((ref) {
  throw UnimplementedError('Provide PetDiaryRepository via PetDiaryRepoProvider');
});

class PetDiaryController extends AsyncNotifier<List<PetDiary>> {
  late final PetDiaryRepository _repo;

  @override
  Future<List<PetDiary>> build() async {
    _repo = ref.read(petDiaryRepoProvider);
    return _repo.list();
  }

  Future<void> upsert(PetDiary input) async {
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

final petDiaryControllerProvider =
AsyncNotifierProvider<PetDiaryController, List<PetDiary>>(() => PetDiaryController());
