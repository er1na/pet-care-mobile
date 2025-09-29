import 'package:pet_care_mobile/features/medicine/domain/medicine.dart';
import 'package:pet_care_mobile/features/medicine/domain/medicine_repository.dart';
import 'package:pet_care_mobile/features/medicine/infra/data_souces/medicine_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class MedicineRepositoryImpl implements
  MedicineRepository {
  final MedicineDao _dao;
  MedicineRepositoryImpl(this._dao);

  @override
  Future<List<Medicine>> list() async {
    final rows = await _dao.listRows();
    return rows.map<Medicine>(_toDomain).toList();
  }

  @override
  Future<Medicine> upsert(Medicine input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  Medicine _toDomain(MedicineRow row) {
    return Medicine(
      localId: row.localId,
      name: row.name,
      effect: row.effect,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  MedicineCompanion _toRow(Medicine entity) {
    return MedicineCompanion(
      localId: Value(entity.localId),
      name: Value(entity.name),
      effect: Value(entity.effect),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}