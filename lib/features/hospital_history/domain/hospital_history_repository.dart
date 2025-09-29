import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history.dart';

abstract class HospitalHistoryRepository {
  Future<List<HospitalHistory>> list();
  Future<HospitalHistory> upsert(HospitalHistory input);
  Future<void> remove(String idOrLocal);
}
