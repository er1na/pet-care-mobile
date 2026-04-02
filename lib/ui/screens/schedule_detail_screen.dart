import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_care_mobile/ui/screens/edit_schedule_screen.dart';
import 'package:pet_care_mobile/features/hospital_history/application/hospital_history_controller.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history.dart';
import 'package:pet_care_mobile/features/vaccine_history/application/vaccine_history_controller.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history.dart';
import 'package:pet_care_mobile/features/medicine_history/application/medicine_history_controller.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history.dart';
import 'package:pet_care_mobile/features/pet_diary/application/pet_diary_controller.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary.dart';
import 'package:pet_care_mobile/features/hospitals/application/hospital_controller.dart';
import 'package:pet_care_mobile/features/vaccines/application/vaccine_controller.dart';
import 'package:pet_care_mobile/features/medicine/application/medicine_controller.dart';
import 'package:pet_care_mobile/features/pets/application/pets_controller.dart';

/// 予定詳細画面
class ScheduleDetailScreen extends ConsumerWidget {
  final String type;
  final dynamic data;

  const ScheduleDetailScreen({
    super.key,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          '$type詳細',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => EditScheduleScreen(type: type, data: data),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_rounded),
            onPressed: () {
              _showDeleteConfirmDialog(context, ref);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildContent(context, ref),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    switch (type) {
      case '通院':
        return _buildHospitalDetail(context, data as HospitalHistory, ref);
      case 'ワクチン':
        return _buildVaccineDetail(context, data as VaccineHistory, ref);
      case '服薬':
        return _buildMedicineDetail(context, data as MedicineHistory, ref);
      case '日記':
        return _buildDiaryDetail(context, data as PetDiary, ref);
      default:
        return const SizedBox.shrink();
    }
  }

  // 通院詳細
  Widget _buildHospitalDetail(
    BuildContext context,
    HospitalHistory history,
    WidgetRef ref,
  ) {
    // 病院マスタを取得
    final hospitalsAsync = ref.watch(hospitalControllerProvider);
    // ペットマスタを取得
    final petsAsync = ref.watch(petsControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          context,
          icon: Icons.local_hospital_rounded,
          color: Colors.red,
          title: '通院情報',
          children: [
            _buildInfoRow(
              '日付',
              DateFormat('yyyy年M月d日(E)', 'ja').format(history.date),
            ),
            if (history.symptom != null && history.symptom!.isNotEmpty)
              _buildInfoRow('症状', history.symptom!),
            if (history.fee != null)
              _buildInfoRow(
                '金額',
                '¥${NumberFormat('#,###').format(history.fee)}',
              ),
            // 病院名を表示
            hospitalsAsync.when(
              data: (hospitals) {
                try {
                  final hospital = hospitals.firstWhere(
                    (h) => h.localId == history.hospitalId,
                  );
                  return _buildInfoRow('病院', hospital.name);
                } catch (e) {
                  return _buildInfoRow('病院', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            // ペット名を表示
            petsAsync.when(
              data: (pets) {
                try {
                  final pet = pets.firstWhere(
                    (p) => p.localId == history.petId,
                  );
                  return _buildInfoRow('ペット', pet.name);
                } catch (e) {
                  return _buildInfoRow('ペット', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        if (history.memo != null && history.memo!.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildMemoCard(context, history.memo!),
        ],
      ],
    );
  }

  // ワクチン詳細
  Widget _buildVaccineDetail(
    BuildContext context,
    VaccineHistory history,
    WidgetRef ref,
  ) {
    // ワクチンマスタを取得
    final vaccinesAsync = ref.watch(vaccineControllerProvider);
    // 病院マスタを取得
    final hospitalsAsync = ref.watch(hospitalControllerProvider);
    // ペットマスタを取得
    final petsAsync = ref.watch(petsControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          context,
          icon: Icons.vaccines_rounded,
          color: Colors.green,
          title: 'ワクチン情報',
          children: [
            _buildInfoRow(
              '日付',
              DateFormat('yyyy年M月d日(E)', 'ja').format(history.date),
            ),
            // ワクチン名を表示
            vaccinesAsync.when(
              data: (vaccines) {
                try {
                  final vaccine = vaccines.firstWhere(
                    (v) => v.localId == history.vaccineId,
                  );
                  return _buildInfoRow('ワクチン', vaccine.name);
                } catch (e) {
                  return _buildInfoRow('ワクチン', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            // 病院名を表示
            hospitalsAsync.when(
              data: (hospitals) {
                try {
                  final hospital = hospitals.firstWhere(
                    (h) => h.localId == history.hospitalId,
                  );
                  return _buildInfoRow('病院', hospital.name);
                } catch (e) {
                  return _buildInfoRow('病院', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            // ペット名を表示
            petsAsync.when(
              data: (pets) {
                try {
                  final pet = pets.firstWhere(
                    (p) => p.localId == history.petId,
                  );
                  return _buildInfoRow('ペット', pet.name);
                } catch (e) {
                  return _buildInfoRow('ペット', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        if (history.memo != null && history.memo!.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildMemoCard(context, history.memo!),
        ],
      ],
    );
  }

  // 服薬詳細
  Widget _buildMedicineDetail(
    BuildContext context,
    MedicineHistory history,
    WidgetRef ref,
  ) {
    // 薬マスタを取得
    final medicinesAsync = ref.watch(medicineControllerProvider);
    // 病院マスタを取得
    final hospitalsAsync = ref.watch(hospitalControllerProvider);
    // ペットマスタを取得
    final petsAsync = ref.watch(petsControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          context,
          icon: Icons.medication_rounded,
          color: Colors.orange,
          title: '服薬情報',
          children: [
            _buildInfoRow(
              '日付',
              DateFormat('yyyy年M月d日(E)', 'ja').format(history.date),
            ),
            // 薬名を表示
            medicinesAsync.when(
              data: (medicines) {
                try {
                  final medicine = medicines.firstWhere(
                    (m) => m.localId == history.medicineId,
                  );
                  return _buildInfoRow('薬', medicine.name);
                } catch (e) {
                  return _buildInfoRow('薬', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            // 病院名を表示
            hospitalsAsync.when(
              data: (hospitals) {
                try {
                  final hospital = hospitals.firstWhere(
                    (h) => h.localId == history.hospitalId,
                  );
                  return _buildInfoRow('病院', hospital.name);
                } catch (e) {
                  return _buildInfoRow('病院', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            // ペット名を表示
            petsAsync.when(
              data: (pets) {
                try {
                  final pet = pets.firstWhere(
                    (p) => p.localId == history.petId,
                  );
                  return _buildInfoRow('ペット', pet.name);
                } catch (e) {
                  return _buildInfoRow('ペット', '未登録');
                }
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        if (history.memo != null && history.memo!.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildMemoCard(context, history.memo!),
        ],
      ],
    );
  }

  // 日記詳細
  Widget _buildDiaryDetail(
    BuildContext context,
    PetDiary diary,
    WidgetRef ref,
  ) {
    // ペットマスタを取得
    final petsAsync = ref.watch(petsControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          context,
          icon: Icons.edit_note_rounded,
          color: Colors.blue,
          title: diary.title,
          children: [
            _buildInfoRow(
              '日付',
              DateFormat('yyyy年M月d日(E)', 'ja').format(diary.date),
            ),
            // ペット名を表示
            if (diary.petId != null)
              petsAsync.when(
                data: (pets) {
                  try {
                    final pet = pets.firstWhere(
                      (p) => p.localId == diary.petId,
                    );
                    return _buildInfoRow('ペット', pet.name);
                  } catch (e) {
                    return _buildInfoRow('ペット', '未登録');
                  }
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.description_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '内容',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                diary.content,
                style: const TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 情報カード
  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  // 情報行
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  // メモカード
  Widget _buildMemoCard(BuildContext context, String memo) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.note_rounded,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'メモ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(memo, style: const TextStyle(fontSize: 14, height: 1.6)),
        ],
      ),
    );
  }

  // 削除確認ダイアログ
  void _showDeleteConfirmDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text('削除確認'),
            content: Text('この$typeを削除しますか？\n削除したデータは復元できません。'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('キャンセル'),
              ),
              FilledButton(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  await _deleteSchedule(context, ref);
                },
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('削除'),
              ),
            ],
          ),
    );
  }

  // 削除処理
  Future<void> _deleteSchedule(BuildContext context, WidgetRef ref) async {
    try {
      String localId;

      switch (type) {
        case '通院':
          final history = data as HospitalHistory;
          localId = history.localId;
          await ref
              .read(hospitalHistoryControllerProvider.notifier)
              .remove(localId);
          break;

        case 'ワクチン':
          final history = data as VaccineHistory;
          localId = history.localId;
          await ref
              .read(vaccineHistoryControllerProvider.notifier)
              .remove(localId);
          break;

        case '服薬':
          final history = data as MedicineHistory;
          localId = history.localId;
          await ref
              .read(medicineHistoryControllerProvider.notifier)
              .remove(localId);
          break;

        case '日記':
          final diary = data as PetDiary;
          localId = diary.localId;
          await ref.read(petDiaryControllerProvider.notifier).remove(localId);
          break;

        default:
          throw Exception('不明な予定タイプ');
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${type}を削除しました'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.green,
          ),
        );

        // 詳細画面を閉じてカレンダーに戻る
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('削除に失敗しました: $e'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
