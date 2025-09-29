import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history.dart';

abstract class MedicineHistoryRepository {
  Future<List<MedicineHistory>> list();
  Future<MedicineHistory> upsert(MedicineHistory input);
  Future<void> remove(String idOrLocal);
}
