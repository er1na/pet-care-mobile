import 'package:drift/drift.dart';
import 'package:pet_care_mobile/core/db/converter.dart';

@DataClassName('PetRow')
class Pets extends Table {
  TextColumn get localId => text()();
  TextColumn get name => text()();
  TextColumn get kinds => text()();
  IntColumn   get sex => integer()();
  DateTimeColumn get birthdate => dateTime().nullable()();

  TextColumn get chronicIllness =>
      text().map(const StringListConverter()).nullable()();

  TextColumn get iconId => text().nullable()();

  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  IntColumn get syncState => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {localId};
}
