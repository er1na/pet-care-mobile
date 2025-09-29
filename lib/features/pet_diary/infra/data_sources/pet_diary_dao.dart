import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/pet_diary_tables.dart';

part 'pet_diary_dao.g.dart';

@DriftAccessor(tables: [PetDiaries])
class PetDiaryDao extends
  DatabaseAccessor<AppDatabase> with _$PetDiaryDaoMixin {
    PetDiaryDao(super.db);

  Future<List<PetDiaryRow>> listRows({
    bool includeDeleted = false}) {
    final q = (select(petDiaries)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if(!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  Future<PetDiaryRow> upsertRow(PetDiariesCompanion row) async {
    final inserted = await into(petDiaries).insertReturning(
        row,
        onConflict: DoUpdate(
                (old) => PetDiariesCompanion(
              petId: row.petId,
              date: row.date,
              title: row.title,
              content: row.content,
              updatedAt: row.updatedAt,
              deletedAt: row.deletedAt,
              syncState: row.syncState,
            ),
            target: [petDiaries.localId]
        )
    );
    return inserted;
  }

  Future<PetDiaryRow?> findById(String id){
    return (select(petDiaries)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(petDiaries)..where((t) => t.localId.equals(id))).write(
      PetDiariesCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1),
      )
    );
  }

  Future<int> hardDeleteById(String id) {
    return (delete(petDiaries)..where((t) => t.localId.equals(id))).go();
  }
}
