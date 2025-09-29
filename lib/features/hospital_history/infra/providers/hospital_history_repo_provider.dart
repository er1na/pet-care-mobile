import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/hospital_history/infra/data_sources/hospital_history_dao.dart';
import 'package:pet_care_mobile/features/hospital_history/infra/repositories/hospital_history_repository_impl.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final hospitalHistoryDaoProvider = Provider<HospitalHistoryDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return HospitalHistoryDao(db);
});

/// Repository（UIは基本ここ経由）
final hospitalHistoryRepositoryProvider = Provider<HospitalHistoryRepository>((ref) {
  final dao = ref.read(hospitalHistoryDaoProvider);
  return HospitalHistoryRepositoryImpl(dao);
});
