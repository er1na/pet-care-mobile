import 'package:pet_care_mobile/features/pets/domain/pet.dart';

abstract class PetRepository {
  Future<List<Pet>> list();
  Future<Pet> upsert(Pet input);
  Future<void> remove(String idOrLocal);
}