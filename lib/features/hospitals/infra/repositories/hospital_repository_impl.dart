import 'package:pet_care_mobile/features/hospitals/domain/hospital.dart';
import 'package:pet_care_mobile/features/hospitals/domain/hospital_repository.dart';
import 'package:pet_care_mobile/features/hospitals/infra/data_sources/hospital_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class HospitalRepositoryImpl implements
  HospitalRepository {
  final HospitalDao _dao;
  HospitalRepositoryImpl(this._dao);

  @override
  Future<List<Hospital>> list() async {
    final rows = await _dao.listRows();
    return rows.map<Hospital>(_toDomain).toList();
  }

  @override
  Future<Hospital> upsert(Hospital input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  Hospital _toDomain(HospitalRow row) {
    return Hospital(
      localId: row.localId,
      name: row.name,
      address: row.address,
      tel: row.tel,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  HospitalsCompanion _toRow(Hospital entity) {
    return HospitalsCompanion(
      localId: Value(entity.localId),
      name: Value(entity.name),
      address: Value(entity.address),
      tel: Value(entity.tel),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}
