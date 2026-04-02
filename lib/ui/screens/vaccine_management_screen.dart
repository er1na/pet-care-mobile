import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_mobile/features/vaccines/application/vaccine_controller.dart';
import 'package:pet_care_mobile/features/vaccines/domain/vaccine.dart';
import 'package:pet_care_mobile/ui/screens/add_vaccine_screen.dart';

/// ワクチン管理画面
class VaccineManagementScreen extends ConsumerWidget {
  const VaccineManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vaccineControllerProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'ワクチン管理',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddVaccineScreen(),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラー: $e')),
        data: (vaccines) {
          if (vaccines.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.vaccines_outlined,
                    size: 64,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ワクチンが登録されていません',
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
            itemCount: vaccines.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final vaccine = vaccines[index];
              return _VaccineCard(vaccine: vaccine);
            },
          );
        },
      ),
    );
  }
}

class _VaccineCard extends ConsumerWidget {
  const _VaccineCard({required this.vaccine});

  final Vaccine vaccine;

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
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.vaccines_rounded,
            color: Colors.green.shade600,
            size: 24,
          ),
        ),
        title: Text(
          vaccine.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: vaccine.memo != null && vaccine.memo!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  vaccine.memo!,
                  style:
                      TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : null,
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
                        AddVaccineScreen(vaccine: vaccine),
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
        content: Text('「${vaccine.name}」を削除してもよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () async {
              await ref
                  .read(vaccineControllerProvider.notifier)
                  .remove(vaccine.localId);
              if (context.mounted) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('「${vaccine.name}」を削除しました'),
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
