import 'package:pet_care_mobile/features/vaccines/domain/vaccine.dart';

abstract class VaccineRepository {
  Future<List<Vaccine>> list();
  Future<Vaccine> upsert(Vaccine input);
  Future<void> remove(String idOrLocal);
}
