import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/hospitals/application/hospital_controller.dart';
import 'package:pet_care_mobile/features/hospitals/domain/hospital.dart';
import 'package:pet_care_mobile/ui/screens/add_hospital_screen.dart';

/// 病院管理画面
class HospitalManagementScreen extends ConsumerWidget {
  const HospitalManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hospitalControllerProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          '病院管理',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddHospitalScreen(),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラー: $e')),
        data: (hospitals) {
          if (hospitals.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_hospital_outlined,
                    size: 64,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '病院が登録されていません',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '右下のボタンから追加してください',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: hospitals.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final hospital = hospitals[index];
              return _HospitalCard(hospital: hospital);
            },
          );
        },
      ),
    );
  }
}

class _HospitalCard extends ConsumerWidget {
  const _HospitalCard({required this.hospital});

  final Hospital hospital;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.local_hospital_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        title: Text(
          hospital.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hospital.address.isNotEmpty) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 13, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      hospital.address,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey.shade600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
            if (hospital.tel.isNotEmpty) ...[
              const SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.phone_outlined,
                      size: 13, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Text(
                    hospital.tel,
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              color: Colors.grey.shade600,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        AddHospitalScreen(hospital: hospital),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              color: Colors.red.shade300,
              onPressed: () => _showDeleteConfirmDialog(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('削除の確認'),
        content: Text('「${hospital.name}」を削除してもよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () async {
              await ref
                  .read(hospitalControllerProvider.notifier)
                  .remove(hospital.localId);
              if (context.mounted) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('「${hospital.name}」を削除しました'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('削除'),
          ),
        ],
      ),
    );
  }
}
