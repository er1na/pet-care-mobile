import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/hospital_tables.dart';

part 'hospital_dao.g.dart';

@DriftAccessor(tables: [Hospitals])
class HospitalDao extends
  DatabaseAccessor<AppDatabase> with _$HospitalDaoMixin {
    HospitalDao(super.db);

  Future<List<HospitalRow>> listRows({
    bool includeDeleted = false}) {
    final q = (select(hospitals)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if(!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  Future<HospitalRow> upsertRow(HospitalsCompanion row) async {
    final inserted = await into(hospitals).insertReturning(
        row,
        onConflict: DoUpdate(
                (old) => HospitalsCompanion(
              name: row.name,
              address: row.address,
              tel: row.tel,
              updatedAt: row.updatedAt,
              deletedAt: row.deletedAt,
              syncState: row.syncState,
            ),
            target: [hospitals.localId]
        )
    );
    return inserted;
  }

  Future<HospitalRow?> findById(String id){
    return (select(hospitals)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(hospitals)..where((t) => t.localId.equals(id))).write(
      HospitalsCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1),
      )
    );
  }

  Future<int> hardDeleteById(String id) {
    return (delete(hospitals)..where((t) => t.localId.equals(id))).go();
  }
}
