import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/vaccines/infra/data_sources/vaccine_dao.dart';
import 'package:pet_care_mobile/features/vaccines/infra/repositories/vaccine_repository_impl.dart';
import 'package:pet_care_mobile/features/vaccines/domain/vaccine_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final vaccineDaoProvider = Provider<VaccineDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return VaccineDao(db);
});

/// Repository（UIは基本ここ経由）
final vaccineRepositoryProvider = Provider<VaccineRepository>((ref) {
  final dao = ref.read(vaccineDaoProvider);
  return VaccineRepositoryImpl(dao);
});
