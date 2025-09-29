import 'package:drift/drift.dart';

import 'package:pet_care_mobile/core/db/pet_tables.dart';


@DataClassName('PetDiaryRow')
class PetDiaries extends Table {
  TextColumn get localId => text()();
  TextColumn get petId => text().references(Pets, #localId, onDelete: KeyAction.cascade).nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get syncState => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {localId};
}