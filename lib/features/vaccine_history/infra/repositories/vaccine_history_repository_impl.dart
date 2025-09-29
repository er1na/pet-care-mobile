import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history_repository.dart';
import 'package:pet_care_mobile/features/vaccine_history/infra/data_sources/vaccine_history_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class VaccineHistoryRepositoryImpl implements
  VaccineHistoryRepository {
  final VaccineHistoryDao _dao;
  VaccineHistoryRepositoryImpl(this._dao);

  @override
  Future<List<VaccineHistory>> list() async {
    final rows = await _dao.listRows();
    return rows.map<VaccineHistory>(_toDomain).toList();
  }

  @override
  Future<VaccineHistory> upsert(VaccineHistory input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  VaccineHistory _toDomain(VaccineHistoryRow row) {
    return VaccineHistory(
      localId: row.localId,
      petId: row.petId ?? '',
      hospitalId: row.hospitalId ?? '',
      vaccineId: row.vaccineId ?? '',
      date: row.date,
      memo: row.memo,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

    VaccineHistoriesCompanion _toRow(VaccineHistory entity) {
    return VaccineHistoriesCompanion(
      localId: Value(entity.localId),
      petId: Value(entity.petId),
      hospitalId: Value(entity.hospitalId),
      vaccineId: Value(entity.vaccineId),
      date: Value(entity.date),
      memo: Value(entity.memo),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}
