import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history_repository.dart';
import 'package:pet_care_mobile/features/medicine_history/infra/data_sources/medicine_history_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class MedicineHistoryRepositoryImpl implements
  MedicineHistoryRepository {
  final MedicineHistoryDao _dao;
  MedicineHistoryRepositoryImpl(this._dao);

  @override
  Future<List<MedicineHistory>> list() async {
    final rows = await _dao.listRows();
    return rows.map<MedicineHistory>(_toDomain).toList();
  }

  @override
  Future<MedicineHistory> upsert(MedicineHistory input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  MedicineHistory _toDomain(MedicineHistoryRow row) {
    return MedicineHistory(
      localId: row.localId,
      petId: row.petId ?? '',
      hospitalId: row.hospitalId ?? '',
      medicineId: row.medicineId ?? '',
      date: row.date,
      memo: row.memo,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  MedicineHistoriesCompanion _toRow(MedicineHistory entity) {
    return MedicineHistoriesCompanion(
      localId: Value(entity.localId),
      petId: Value(entity.petId),
      hospitalId: Value(entity.hospitalId),
      medicineId: Value(entity.medicineId),
      date: Value(entity.date),
      memo: Value(entity.memo),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}
