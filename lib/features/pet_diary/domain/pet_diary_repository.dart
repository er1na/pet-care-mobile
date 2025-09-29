import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary.dart';

abstract class PetDiaryRepository {
  Future<List<PetDiary>> list();
  Future<PetDiary> upsert(PetDiary input);
  Future<void> remove(String idOrLocal);
}
