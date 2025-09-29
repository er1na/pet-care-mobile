import 'package:drift/drift.dart';

@DataClassName('MedicineRow')
class Medicine extends Table {
  TextColumn get localId => text()();
  TextColumn get name => text()();
  TextColumn get effect => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get syncState => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {localId};
}