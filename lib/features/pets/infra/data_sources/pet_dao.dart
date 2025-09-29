// features/pets/infrastructure/data_sources/pet_dao.dart
import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/pet_tables.dart';

part 'pet_dao.g.dart';

/// DB視点の薄いI/O。Domain(Pet)は返さず、Row/Companionのみ扱う。
@DriftAccessor(tables: [Pets])
class PetDao extends DatabaseAccessor<AppDatabase> with _$PetDaoMixin {
  PetDao(super.db);

  /// 論理削除を除いた一覧（updatedAt DESC）
  Future<List<PetRow>> listRows({bool includeDeleted = false}) {
    final q = (select(pets)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]));
    if (!includeDeleted) {
      q.where((t) => t.deletedAt.isNull());
    }
    return q.get();
  }

  /// 主キー競合時は更新（Upsert）
  Future<PetRow> upsertRow(PetsCompanion row) async {
    final inserted = await into(pets).insertReturning(
      row,
      onConflict: DoUpdate(
            (old) => PetsCompanion(
          name: row.name,
          kinds: row.kinds,
          sex: row.sex,
          birthdate: row.birthdate,
          chronicIllness: row.chronicIllness,
          iconId: row.iconId,
          updatedAt: row.updatedAt,
          deletedAt: row.deletedAt,
          syncState: row.syncState,
        ),
        target: [pets.localId], // 主キー衝突時にこの列で更新
      ),
    );
    return inserted;
  }

  /// 単一取得
  Future<PetRow?> findById(String id) {
    return (select(pets)..where((t) => t.localId.equals(id))).getSingleOrNull();
  }

  /// 論理削除（deletedAt を入れて dirty に）
  Future<int> softDeleteById(String id, DateTime ts) {
    return (update(pets)..where((t) => t.localId.equals(id))).write(
      PetsCompanion(
        deletedAt: Value(ts),
        updatedAt: Value(ts),
        syncState: const Value(1), // 1: dirty
      ),
    );
  }

  /// 物理削除（メンテ/テスト用）
  Future<int> hardDeleteById(String id) {
    return (delete(pets)..where((t) => t.localId.equals(id))).go();
  }

  /// 名前/犬種の部分一致検索（必要なら）
  Future<List<PetRow>> search({String? keyword}) {
    final q = (select(pets)
      ..where((t) => t.deletedAt.isNull())
      ..orderBy([(t) => OrderingTerm.asc(t.name)]));
    if (keyword != null && keyword.isNotEmpty) {
      final like = '%$keyword%';
      q.where((t) => t.name.like(like) | t.kinds.like(like));
    }
    return q.get();
  }
}
