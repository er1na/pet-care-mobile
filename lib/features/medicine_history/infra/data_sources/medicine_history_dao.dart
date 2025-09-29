import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/medicine_history_tables.dart';

part 'medicine_history_dao.g.dart';

@DriftAccessor(tables: [MedicineHistories])
class MedicineHistoryDao extends
  DatabaseAccessor<AppDatabase> with _$MedicineHistoryDaoMixin {
    MedicineHistoryDao(super.db);

  Future<List<MedicineHistoryRow>> listRows({
    bool includeDeleted = false}) {
    final q = (select(medicineHistories)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if(!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  Future<MedicineHistoryRow> upsertRow(MedicineHistoriesCompanion row) async {
    final inserted = await into(medicineHistories).insertReturning(
        row,
        onConflict: DoUpdate(
                (old) => MedicineHistoriesCompanion(
              petId: row.petId,
              hospitalId: row.hospitalId,
              medicineId: row.medicineId,
              date: row.date,
              memo: row.memo,
              updatedAt: row.updatedAt,
              deletedAt: row.deletedAt,
              syncState: row.syncState,
            ),
            target: [medicineHistories.localId]
        )
    );
    return inserted;
  }

  Future<MedicineHistoryRow?> findById(String id){
    return (select(medicineHistories)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(medicineHistories)..where((t) => t.localId.equals(id))).write(
      MedicineHistoriesCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1),
      )
    );
  }

  Future<int> hardDeleteById(String id) {
    return (delete(medicineHistories)..where((t) => t.localId.equals(id))).go();
  }
}
