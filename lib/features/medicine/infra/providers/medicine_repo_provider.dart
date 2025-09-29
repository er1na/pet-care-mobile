import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/medicine/infra/data_souces/medicine_dao.dart';
import 'package:pet_care_mobile/features/medicine/infra/repositories/medicine_repository_impl.dart';
import 'package:pet_care_mobile/features/medicine/domain/medicine_repository.dart';
import 'package:pet_care_mobile/features/db_provider.dart';

final medicineDaoProvider = Provider<MedicineDao>((ref) {
  final db = ref.read(appDatabaseProvider);
  return MedicineDao(db);
});

/// Repository（UIは基本ここ経由）
final petRepositoryProvider = Provider<MedicineRepository>((ref) {
  final dao = ref.read(medicineDaoProvider);
  return MedicineRepositoryImpl(dao);
});