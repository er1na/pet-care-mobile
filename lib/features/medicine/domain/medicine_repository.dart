import 'package:pet_care_mobile/features/medicine/domain/medicine.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> list();
  Future<Medicine> upsert(Medicine input);
  Future<void> remove(String idOrLocal);
}