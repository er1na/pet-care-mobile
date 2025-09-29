import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history_repository.dart';
import 'package:pet_care_mobile/features/hospital_history/infra/data_sources/hospital_history_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class HospitalHistoryRepositoryImpl implements
  HospitalHistoryRepository {
  final HospitalHistoryDao _dao;
  HospitalHistoryRepositoryImpl(this._dao);

  @override
  Future<List<HospitalHistory>> list() async {
    final rows = await _dao.listRows();
    return rows.map<HospitalHistory>(_toDomain).toList();
  }

  @override
  Future<HospitalHistory> upsert(HospitalHistory input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  HospitalHistory _toDomain(HospitalHistoryRow row) {
    return HospitalHistory(
      localId: row.localId,
      petId: row.petId ?? '',
      hospitalId: row.hospitalId ?? '',
      date: row.date,
      symptom: row.symptom,
      fee: row.fee,
      memo: row.memo,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  HospitalHistoriesCompanion _toRow(HospitalHistory entity) {
    return HospitalHistoriesCompanion(
      localId: Value(entity.localId),
      petId: Value(entity.petId),
      hospitalId: Value(entity.hospitalId),
      date: Value(entity.date),
      symptom: Value(entity.symptom),
      fee: Value(entity.fee),
      memo: Value(entity.memo),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}
