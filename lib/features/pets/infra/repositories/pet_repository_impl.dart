import 'package:pet_care_mobile/features/pets/domain/pet.dart';
import 'package:pet_care_mobile/features/pets/domain/pet_repository.dart';
import 'package:pet_care_mobile/features/pets/infra/data_sources/pet_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

/// DriftのDAOを使った PetRepository 実装
class PetRepositoryImpl implements PetRepository {
  final PetDao _dao;

  PetRepositoryImpl(this._dao);

  @override
  Future<List<Pet>> list() async {
    final rows = await _dao.listRows();
    return rows.map<Pet>(_toDomain).toList();
  }

  @override
  Future<Pet> upsert(Pet input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  // --- Mapper: Row -> Domain ---
  Pet _toDomain(PetRow row) {
    return Pet(
      localId: row.localId,
      name: row.name,
      kind: row.kinds,
      sex: row.sex,
      birthdate: row.birthdate,
      chronicIllness: row.chronicIllness,
      iconId: row.iconId,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  // --- Mapper: Domain -> Row(Companion) ---
  PetsCompanion _toRow(Pet entity) {
    return PetsCompanion(
      localId: Value(entity.localId),
      name: Value(entity.name),
      kinds: Value(entity.kind),
      sex: Value(entity.sex),
      birthdate: Value(entity.birthdate),
      chronicIllness: Value(entity.chronicIllness),
      iconId: Value(entity.iconId),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}