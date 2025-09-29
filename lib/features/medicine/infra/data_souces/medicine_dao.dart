import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/medicine_tables.dart';

part 'medicine_dao.g.dart';

@DriftAccessor(tables: [Medicine])
class MedicineDao extends
  DatabaseAccessor<AppDatabase> with _$MedicineDaoMixin {
    MedicineDao(super.db);

  Future<List<MedicineRow>> listRows({
    bool includeDeleted = false}) {
    final q = (select(medicine)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if(!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  Future<MedicineRow> upsertRow(MedicineCompanion row) async {
    final inserted = await into(medicine).insertReturning(
        row,
        onConflict: DoUpdate(
                (old) => MedicineCompanion(
              name: row.name,
              effect: row.effect,
              updatedAt: row.updatedAt,
              deletedAt: row.deletedAt,
              syncState: row.syncState,
            ),
            target: [medicine.localId]
        )
    );
    return inserted;
  }

  Future<MedicineRow?> findById(String id){
    return (select(medicine)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(medicine)..where((t) => t.localId.equals(id))).write(
      MedicineCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1),
      )
    );
  }

  Future<int> hardDeleteById(String id) {
    return (delete(medicine)..where((t) => t.localId.equals(id))).go();
  }
}







