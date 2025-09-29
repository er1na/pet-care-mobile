import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary_repository.dart';
import 'package:pet_care_mobile/features/pet_diary/infra/data_sources/pet_diary_dao.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:drift/drift.dart';

class PetDiaryRepositoryImpl implements
  PetDiaryRepository {
  final PetDiaryDao _dao;
  PetDiaryRepositoryImpl(this._dao);

  @override
  Future<List<PetDiary>> list() async {
    final rows = await _dao.listRows();
    return rows.map<PetDiary>(_toDomain).toList();
  }

  @override
  Future<PetDiary> upsert(PetDiary input) async {
    final row = _toRow(input);
    final inserted = await _dao.upsertRow(row);
    return _toDomain(inserted);
  }

  @override
  Future<void> remove(String idOrLocal) async {
    await _dao.softDeleteById(idOrLocal, DateTime.now());
  }

  PetDiary _toDomain(PetDiaryRow row) {
    return PetDiary(
      localId: row.localId,
      petId: row.petId,
      date: row.date,
      title: row.title,
      content: row.content,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncState: row.syncState,
    );
  }

  PetDiariesCompanion _toRow(PetDiary entity) {
    return PetDiariesCompanion(
      localId: Value(entity.localId),
      petId: Value(entity.petId),
      date: Value(entity.date),
      title: Value(entity.title),
      content: Value(entity.content),
      updatedAt: Value(entity.updatedAt),
      deletedAt: Value(entity.deletedAt),
      syncState: Value(entity.syncState),
    );
  }
}
