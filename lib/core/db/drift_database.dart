// core/db/drift_database.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'converter.dart';
import 'pet_tables.dart';
import 'package:pet_care_mobile/features/pets/infra/data_sources/pet_dao.dart';
import 'medicine_tables.dart';
import 'package:pet_care_mobile/features/medicine/infra/data_souces/medicine_dao.dart';
import 'hospital_tables.dart';
import 'hospital_history_tables.dart';
import 'medicine_history_tables.dart';
import 'vaccine_tables.dart';
import 'vaccine_history_tables.dart';
import 'pet_diary_tables.dart';
import 'package:pet_care_mobile/features/hospitals/infra/data_sources/hospital_dao.dart';
import 'package:pet_care_mobile/features/hospital_history/infra/data_sources/hospital_history_dao.dart';
import 'package:pet_care_mobile/features/medicine_history/infra/data_sources/medicine_history_dao.dart';
import 'package:pet_care_mobile/features/vaccines/infra/data_sources/vaccine_dao.dart';
import 'package:pet_care_mobile/features/vaccine_history/infra/data_sources/vaccine_history_dao.dart';
import 'package:pet_care_mobile/features/pet_diary/infra/data_sources/pet_diary_dao.dart';

part 'drift_database.g.dart';

@DriftDatabase(tables: [Pets, Medicine, Hospitals, HospitalHistories, MedicineHistories, Vaccines, VaccineHistories, PetDiaries], daos: [PetDao, MedicineDao, HospitalDao, HospitalHistoryDao, MedicineHistoryDao, VaccineDao, VaccineHistoryDao, PetDiaryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // 将来スキーマ変更が入った時にここに書く
    },
  );
}

LazyDatabase _open() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'pet_care.db'));
    return NativeDatabase(file);
  });
}
