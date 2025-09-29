import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/pets/infra/data_sources/pet_dao.dart';
import 'package:pet_care_mobile/features/pets/infra/repositories/pet_repository_impl.dart';
import 'package:pet_care_mobile/features/pets/domain/pet_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

/// DAO
final petDaoProvider = Provider<PetDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return PetDao(db);
});

/// Repository（UIは基本ここ経由）
final petRepositoryProvider = Provider<PetRepository>((ref) {
  final dao = ref.read(petDaoProvider);
  return PetRepositoryImpl(dao);
});
