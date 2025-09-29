import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/hospital_history_tables.dart';

part 'hospital_history_dao.g.dart';

@DriftAccessor(tables: [HospitalHistories])
class HospitalHistoryDao extends DatabaseAccessor<AppDatabase> with _$HospitalHistoryDaoMixin {
  HospitalHistoryDao(super.db);

  /// 論理削除を除いた一覧（updatedAt DESC）
  Future<List<HospitalHistoryRow>> listRows({bool includeDeleted = false}) {
    final q = (select(hospitalHistories)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if (!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  /// 主キー競合時は更新（Upsert）
  Future<HospitalHistoryRow> upsertRow(HospitalHistoriesCompanion row) async {
    final inserted = await into(hospitalHistories).insertReturning(
      row,
      onConflict: DoUpdate(
            (old) => HospitalHistoriesCompanion(
          petId: row.petId,
          hospitalId: row.hospitalId,
          date: row.date,
          symptom: row.symptom,
          fee: row.fee,
          memo: row.memo,
          updatedAt: row.updatedAt,
          deletedAt: row.deletedAt,
          syncState: row.syncState,
        ),
        target: [hospitalHistories.localId], // 主キー衝突時にこの列で更新
      ),
    );
    return inserted;
  }

  /// 単一取得
  Future<HospitalHistoryRow?> findById(String id) {
    return (select(hospitalHistories)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  /// 論理削除（deletedAt を入れて dirty に）
  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(hospitalHistories)..where((t) => t.localId.equals(id))).write(
      HospitalHistoriesCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1), // 1: dirty
      ),
    );
  }

  /// 物理削除（メンテ/テスト用）
  Future<int> hardDeleteById(String id) {
    return (delete(hospitalHistories)..where((t) => t.localId.equals(id))).go();
  }

}