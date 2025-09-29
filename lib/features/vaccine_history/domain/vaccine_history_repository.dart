import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history.dart';

abstract class VaccineHistoryRepository {
  Future<List<VaccineHistory>> list();
  Future<VaccineHistory> upsert(VaccineHistory input);
  Future<void> remove(String idOrLocal);
}
