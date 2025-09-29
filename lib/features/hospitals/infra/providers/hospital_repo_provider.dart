import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/hospitals/infra/data_sources/hospital_dao.dart';
import 'package:pet_care_mobile/features/hospitals/infra/repositories/hospital_repository_impl.dart';
import 'package:pet_care_mobile/features/hospitals/domain/hospital_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final hospitalDaoProvider = Provider<HospitalDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return HospitalDao(db);
});

/// Repository（UIは基本ここ経由）
final hospitalRepositoryProvider = Provider<HospitalRepository>((ref) {
  final dao = ref.read(hospitalDaoProvider);
  return HospitalRepositoryImpl(dao);
});
