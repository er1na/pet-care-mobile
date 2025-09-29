import 'package:drift/drift.dart';

@DataClassName('VaccineRow')
class Vaccines extends Table {
  TextColumn get localId => text()();
  TextColumn get name => text()();
  TextColumn get memo => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get syncState => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {localId};
}