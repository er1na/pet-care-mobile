import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/vaccine_tables.dart';

part 'vaccine_dao.g.dart';

@DriftAccessor(tables: [Vaccines])
class VaccineDao extends
  DatabaseAccessor<AppDatabase> with _$VaccineDaoMixin {
    VaccineDao(super.db);

  Future<List<VaccineRow>> listRows({
    bool includeDeleted = false}) {
    final q = (select(vaccines)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if(!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  Future<VaccineRow> upsertRow(VaccinesCompanion row) async {
    final inserted = await into(vaccines).insertReturning(
        row,
        onConflict: DoUpdate(
                (old) => VaccinesCompanion(
              name: row.name,
              memo: row.memo,
              updatedAt: row.updatedAt,
              deletedAt: row.deletedAt,
              syncState: row.syncState,
            ),
            target: [vaccines.localId]
        )
    );
    return inserted;
  }

  Future<VaccineRow?> findById(String id){
    return (select(vaccines)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(vaccines)..where((t) => t.localId.equals(id))).write(
      VaccinesCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1),
      )
    );
  }

  Future<int> hardDeleteById(String id) {
    return (delete(vaccines)..where((t) => t.localId.equals(id))).go();
  }
}
