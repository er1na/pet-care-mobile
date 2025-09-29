import 'package:pet_care_mobile/features/hospitals/domain/hospital.dart';

abstract class HospitalRepository {
  Future<List<Hospital>> list();
  Future<Hospital> upsert(Hospital input);
  Future<void> remove(String idOrLocal);
}
