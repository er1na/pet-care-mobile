import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/vaccine_history/infra/data_sources/vaccine_history_dao.dart';
import 'package:pet_care_mobile/features/vaccine_history/infra/repositories/vaccine_history_repository_impl.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final vaccineHistoryDaoProvider = Provider<VaccineHistoryDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return VaccineHistoryDao(db);
});

/// Repository（UIは基本ここ経由）
final vaccineHistoryRepositoryProvider = Provider<VaccineHistoryRepository>((ref) {
  final dao = ref.read(vaccineHistoryDaoProvider);
  return VaccineHistoryRepositoryImpl(dao);
});
