import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/vaccine_history_tables.dart';

part 'vaccine_history_dao.g.dart';

@DriftAccessor(tables: [VaccineHistories])
class VaccineHistoryDao extends
  DatabaseAccessor<AppDatabase> with _$VaccineHistoryDaoMixin {
    VaccineHistoryDao(super.db);

  Future<List<VaccineHistoryRow>> listRows({
    bool includeDeleted = false}) {
    final q = (select(vaccineHistories)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if(!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  Future<VaccineHistoryRow> upsertRow(VaccineHistoriesCompanion row) async {
    final inserted = await into(vaccineHistories).insertReturning(
        row,
        onConflict: DoUpdate(
                (old) => VaccineHistoriesCompanion(
              petId: row.petId,
              hospitalId: row.hospitalId,
              vaccineId: row.vaccineId,
              date: row.date,
              memo: row.memo,
              updatedAt: row.updatedAt,
              deletedAt: row.deletedAt,
              syncState: row.syncState,
            ),
            target: [vaccineHistories.localId]
        )
    );
    return inserted;
  }

  Future<VaccineHistoryRow?> findById(String id){
    return (select(vaccineHistories)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(vaccineHistories)..where((t) => t.localId.equals(id))).write(
      VaccineHistoriesCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1),
      )
    );
  }

  Future<int> hardDeleteById(String id) {
    return (delete(vaccineHistories)..where((t) => t.localId.equals(id))).go();
  }
}
