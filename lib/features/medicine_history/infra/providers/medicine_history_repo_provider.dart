import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/medicine_history/infra/data_sources/medicine_history_dao.dart';
import 'package:pet_care_mobile/features/medicine_history/infra/repositories/medicine_history_repository_impl.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final medicineHistoryDaoProvider = Provider<MedicineHistoryDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return MedicineHistoryDao(db);
});

/// Repository（UIは基本ここ経由）
final medicineHistoryRepositoryProvider = Provider<MedicineHistoryRepository>((ref) {
  final dao = ref.read(medicineHistoryDaoProvider);
  return MedicineHistoryRepositoryImpl(dao);
});
