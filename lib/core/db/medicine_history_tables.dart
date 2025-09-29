import 'package:drift/drift.dart';

import 'package:pet_care_mobile/core/db/pet_tables.dart';
import 'package:pet_care_mobile/core/db/medicine_tables.dart';
import 'package:pet_care_mobile/core/db/hospital_tables.dart';

@DataClassName('MedicineHistoryRow')
class MedicineHistories extends Table {
  TextColumn get localId => text()();
  TextColumn get petId => text().references(Pets, #localId, onDelete: KeyAction.cascade).nullable()();
  TextColumn get hospitalId => text().references(Hospitals, #localId, onDelete: KeyAction.cascade).nullable()();
  TextColumn get medicineId => text().references(Medicine, #localId, onDelete: KeyAction.cascade).nullable()();
  DateTimeColumn get date => dateTime()(); 
  TextColumn get memo => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get syncState => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {localId};
}