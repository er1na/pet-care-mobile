import 'package:pet_care_mobile/features/vaccines/domain/vaccine.dart';
import 'package:pet_care_mobile/features/vaccines/domain/vaccine_repository.dart';
import 'package:pet_care_mobile/features/vaccines/infra/data_sources/vaccine_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class VaccineRepositoryImpl implements
  VaccineRepository {
  final VaccineDao _dao;
  VaccineRepositoryImpl(this._dao);

  @override
  Future<List<Vaccine>> list() async {
    final rows = await _dao.listRows();
    return rows.map<Vaccine>(_toDomain).toList();
  }

  @override
  Future<Vaccine> upsert(Vaccine input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  Vaccine _toDomain(VaccineRow row) {
    return Vaccine(
      localId: row.localId,
      name: row.name,
      memo: row.memo,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  VaccinesCompanion _toRow(Vaccine entity) {
    return VaccinesCompanion(
      localId: Value(entity.localId),
      name: Value(entity.name),
      memo: Value(entity.memo),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}
