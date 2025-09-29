import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});