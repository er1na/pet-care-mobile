import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:uuid/uuid.dart';

/// シードデータを投入するヘルパークラス
class SeedData {
  final AppDatabase db;
  final _uuid = const Uuid();

  SeedData(this.db);

  /// 全てのシードデータを投入
  Future<void> insertAll() async {
    await insertPets();
    await insertHospitals();
    await insertVaccines();
    await insertMedicines();
    await insertHistories();
    await insertDiaries();
  }

  /// ペットのシードデータ
  Future<void> insertPets() async {
    final now = DateTime.now();

    final pets = [
      PetsCompanion.insert(
        localId: _uuid.v4(),
        name: 'りん',
        kinds: 'チワワ',
        sex: 0, // オス
        birthdate: Value(DateTime(2020, 4, 15)),
        chronicIllness: Value(['なし']),
        iconId: const Value(null),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      PetsCompanion.insert(
        localId: _uuid.v4(),
        name: 'レオン',
        kinds: '柴犬',
        sex: 0, // オス
        birthdate: Value(DateTime(2019, 7, 22)),
        chronicIllness: Value(['アレルギー性皮膚炎']),
        iconId: const Value(null),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      PetsCompanion.insert(
        localId: _uuid.v4(),
        name: 'ぷー',
        kinds: 'トイプードル',
        sex: 1, // メス
        birthdate: Value(DateTime(2021, 2, 10)),
        chronicIllness: Value(['なし']),
        iconId: const Value(null),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      PetsCompanion.insert(
        localId: _uuid.v4(),
        name: 'レオナ',
        kinds: 'マンチカン',
        sex: 1, // メス
        birthdate: Value(DateTime(2022, 1, 5)),
        chronicIllness: Value(['なし']),
        iconId: const Value(null),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      PetsCompanion.insert(
        localId: _uuid.v4(),
        name: 'ぽこ',
        kinds: 'スコティッシュフォールド',
        sex: 0, // オス
        birthdate: Value(DateTime(2018, 11, 30)),
        chronicIllness: Value(['関節炎', '慢性腎臓病']),
        iconId: const Value(null),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
    ];

    for (final pet in pets) {
      await db.petDao.upsertRow(pet);
    }
  }

  /// 病院のシードデータ
  Future<void> insertHospitals() async {
    final now = DateTime.now();

    final hospitals = [
      HospitalsCompanion.insert(
        localId: _uuid.v4(),
        name: 'わんにゃん動物病院',
        tel: '03-1234-5678',
        address: '東京都渋谷区〇〇1-2-3',
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      HospitalsCompanion.insert(
        localId: _uuid.v4(),
        name: 'ペットクリニック花',
        tel: '03-9876-5432',
        address: '東京都新宿区△△2-3-4',
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      HospitalsCompanion.insert(
        localId: _uuid.v4(),
        name: 'さくら動物病院',
        tel: '03-5555-6666',
        address: '東京都世田谷区□□3-4-5',
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
    ];

    for (final hospital in hospitals) {
      await db.hospitalDao.upsertRow(hospital);
    }
  }

  /// ワクチンのシードデータ
  Future<void> insertVaccines() async {
    final now = DateTime.now();

    final vaccines = [
      VaccinesCompanion.insert(
        localId: _uuid.v4(),
        name: '狂犬病ワクチン',
        memo: const Value('年1回接種'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      VaccinesCompanion.insert(
        localId: _uuid.v4(),
        name: '混合ワクチン（5種）',
        memo: const Value('年1回接種推奨'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      VaccinesCompanion.insert(
        localId: _uuid.v4(),
        name: '混合ワクチン（8種）',
        memo: const Value('年1回接種推奨'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
    ];

    for (final vaccine in vaccines) {
      await db.vaccineDao.upsertRow(vaccine);
    }
  }

  /// 薬のシードデータ
  Future<void> insertMedicines() async {
    final now = DateTime.now();

    final medicines = [
      MedicineCompanion.insert(
        localId: _uuid.v4(),
        name: 'アレルギー軽減薬',
        effect: const Value('1日2回、食後に服用'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      MedicineCompanion.insert(
        localId: _uuid.v4(),
        name: '抗生物質',
        effect: const Value('1日3回、7日間服用'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      MedicineCompanion.insert(
        localId: _uuid.v4(),
        name: '関節炎治療薬',
        effect: const Value('1日1回、朝食後に服用'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
    ];

    for (final medicine in medicines) {
      await db.medicineDao.upsertRow(medicine);
    }
  }

  /// 履歴データのシードデータ（通院・ワクチン・服薬）
  Future<void> insertHistories() async {
    final now = DateTime.now();

    // ペット一覧を取得
    final pets = await db.petDao.listRows();
    if (pets.isEmpty) return;

    // 病院一覧を取得
    final hospitals = await db.hospitalDao.listRows();
    if (hospitals.isEmpty) return;

    // ワクチン一覧を取得
    final vaccines = await db.vaccineDao.listRows();

    // 薬一覧を取得
    final medicines = await db.medicineDao.listRows();

    // 最初のペットに対して履歴を追加
    final pet = pets.first;
    final hospital = hospitals.first;

    // 通院履歴
    final hospitalHistories = [
      HospitalHistoriesCompanion.insert(
        localId: _uuid.v4(),
        petId: Value(pet.localId),
        hospitalId: Value(hospital.localId),
        date: now.subtract(const Duration(days: 30)),
        symptom: const Value('定期検診'),
        fee: const Value(5000),
        memo: const Value('健康状態良好'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      HospitalHistoriesCompanion.insert(
        localId: _uuid.v4(),
        petId: Value(pet.localId),
        hospitalId: Value(hospital.localId),
        date: now.subtract(const Duration(days: 10)),
        symptom: const Value('皮膚炎'),
        fee: const Value(8000),
        memo: const Value('薬を処方してもらった'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      HospitalHistoriesCompanion.insert(
        localId: _uuid.v4(),
        petId: Value(pet.localId),
        hospitalId: Value(hospital.localId),
        date: now.add(const Duration(days: 7)),
        symptom: const Value('定期検診'),
        fee: const Value(5000),
        memo: const Value('次回の予約'),
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
    ];

    for (final history in hospitalHistories) {
      await db.hospitalHistoryDao.upsertRow(history);
    }

    // ワクチン履歴
    if (vaccines.isNotEmpty) {
      final vaccineHistories = [
        VaccineHistoriesCompanion.insert(
          localId: _uuid.v4(),
          petId: Value(pet.localId),
          hospitalId: Value(hospital.localId),
          vaccineId: Value(vaccines.first.localId),
          date: now.subtract(const Duration(days: 60)),
          memo: const Value('狂犬病ワクチン接種完了'),
          updatedAt: now,
          deletedAt: const Value(null),
          syncState: const Value(0),
        ),
        VaccineHistoriesCompanion.insert(
          localId: _uuid.v4(),
          petId: Value(pet.localId),
          hospitalId: Value(hospital.localId),
          vaccineId: Value(vaccines.first.localId),
          date: now.add(const Duration(days: 14)),
          memo: const Value('次回ワクチン接種予定'),
          updatedAt: now,
          deletedAt: const Value(null),
          syncState: const Value(0),
        ),
      ];

      for (final history in vaccineHistories) {
        await db.vaccineHistoryDao.upsertRow(history);
      }
    }

    // 服薬履歴
    if (medicines.isNotEmpty) {
      final medicineHistories = [
        MedicineHistoriesCompanion.insert(
          localId: _uuid.v4(),
          petId: Value(pet.localId),
          hospitalId: Value(hospital.localId),
          medicineId: Value(medicines.first.localId),
          date: now.subtract(const Duration(days: 5)),
          memo: const Value('朝晩2回服用'),
          updatedAt: now,
          deletedAt: const Value(null),
          syncState: const Value(0),
        ),
        MedicineHistoriesCompanion.insert(
          localId: _uuid.v4(),
          petId: Value(pet.localId),
          hospitalId: Value(hospital.localId),
          medicineId: Value(medicines.first.localId),
          date: now,
          memo: const Value('今日の服用'),
          updatedAt: now,
          deletedAt: const Value(null),
          syncState: const Value(0),
        ),
      ];

      for (final history in medicineHistories) {
        await db.medicineHistoryDao.upsertRow(history);
      }
    }
  }

  /// 日記のシードデータ
  Future<void> insertDiaries() async {
    final now = DateTime.now();

    // ペット一覧を取得
    final pets = await db.petDao.listRows();
    if (pets.isEmpty) return;

    final pet = pets.first;

    final diaries = [
      PetDiariesCompanion.insert(
        localId: _uuid.v4(),
        petId: Value(pet.localId),
        date: now.subtract(const Duration(days: 3)),
        title: 'お散歩日和',
        content: '今日は天気が良かったので、いつもより長くお散歩しました。とても楽しそうでした！',
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      PetDiariesCompanion.insert(
        localId: _uuid.v4(),
        petId: Value(pet.localId),
        date: now.subtract(const Duration(days: 1)),
        title: '新しいおもちゃ',
        content: '新しいおもちゃを買ってあげました。とても気に入ったようで、一日中遊んでいました。',
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
      PetDiariesCompanion.insert(
        localId: _uuid.v4(),
        petId: Value(pet.localId),
        date: now,
        title: '今日の様子',
        content: '今日は少し元気がないような気がしました。様子を見て、明日も同じようなら病院に連れて行こうと思います。',
        updatedAt: now,
        deletedAt: const Value(null),
        syncState: const Value(0),
      ),
    ];

    for (final diary in diaries) {
      await db.petDiaryDao.upsertRow(diary);
    }
  }

  /// 全てのデータを削除（テスト用）
  Future<void> clearAll() async {
    await db.transaction(() async {
      await db.delete(db.petDiaries).go();
      await db.delete(db.medicineHistories).go();
      await db.delete(db.vaccineHistories).go();
      await db.delete(db.hospitalHistories).go();
      await db.delete(db.medicine).go();
      await db.delete(db.vaccines).go();
      await db.delete(db.hospitals).go();
      await db.delete(db.pets).go();
    });
  }
}
