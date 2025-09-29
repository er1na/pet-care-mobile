import 'package:drift/drift.dart';

@DataClassName('HospitalRow')
class Hospitals extends Table {
  TextColumn get localId => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get tel => text()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get syncState => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {localId};
}