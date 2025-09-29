import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/pet_diary/infra/data_sources/pet_diary_dao.dart';
import 'package:pet_care_mobile/features/pet_diary/infra/repositories/pet_diary_repository_impl.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final petDiaryDaoProvider = Provider<PetDiaryDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return PetDiaryDao(db);
});

/// Repository（UIは基本ここ経由）
final petDiaryRepositoryProvider = Provider<PetDiaryRepository>((ref) {
  final dao = ref.read(petDiaryDaoProvider);
  return PetDiaryRepositoryImpl(dao);
});
