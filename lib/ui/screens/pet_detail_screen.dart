import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_care_mobile/features/pets/domain/pet.dart';
import 'package:pet_care_mobile/features/pets/application/pets_controller.dart';

/// ペット詳細画面
class PetDetailScreen extends ConsumerWidget {
  const PetDetailScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'ペット詳細',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () => _showDeleteConfirmDialog(context, ref),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ペットアイコンとヘッダー
            _buildHeader(context),
            const SizedBox(height: 16),
            // 詳細情報
            _buildInfoSection(context),
            const SizedBox(height: 16),
            // 持病情報
            _buildChronicIllnessSection(context),
            const SizedBox(height: 16),
            // 更新日時
            _buildUpdateInfo(context),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // ヘッダーセクション
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Column(
        children: [
          // アイコン
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(56),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.pets,
              color: Theme.of(context).colorScheme.primary,
              size: 64,
            ),
          ),
          const SizedBox(height: 16),
          // 名前
          Text(
            pet.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          // 種類
          Text(
            pet.kind,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  // 詳細情報セクション
  Widget _buildInfoSection(BuildContext context) {
    final sexIcon = pet.sex == 0 ? '♂ オス' : '♀ メス';
    final age = pet.birthdate != null ? _calculateAge(pet.birthdate!) : '不明';
    final birthdateStr =
        pet.birthdate != null
            ? DateFormat('yyyy年M月d日').format(pet.birthdate!)
            : '未設定';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                '基本情報',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            icon: Icons.badge_outlined,
            label: '名前',
            value: pet.name,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            context,
            icon: Icons.category_outlined,
            label: '種類',
            value: pet.kind,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            context,
            icon: Icons.wc_outlined,
            label: '性別',
            value: sexIcon,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            context,
            icon: Icons.cake_outlined,
            label: '誕生日',
            value: birthdateStr,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            context,
            icon: Icons.timer_outlined,
            label: '年齢',
            value: age,
          ),
        ],
      ),
    );
  }

  // 持病セクション
  Widget _buildChronicIllnessSection(BuildContext context) {
    final hasIllness =
        pet.chronicIllness != null && pet.chronicIllness!.isNotEmpty;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.medical_information_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                '持病',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (hasIllness)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  pet.chronicIllness!
                      .map(
                        (illness) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.orange.shade200,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            illness,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            )
          else
            Text(
              'なし',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
        ],
      ),
    );
  }

  // 更新情報セクション
  Widget _buildUpdateInfo(BuildContext context) {
    final updateDateStr = DateFormat('yyyy年M月d日 HH:mm').format(pet.updatedAt);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.update_rounded, color: Colors.grey.shade600, size: 16),
          const SizedBox(width: 8),
          Text(
            '最終更新: $updateDateStr',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // 情報行
  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 20),
        const SizedBox(width: 12),
        SizedBox(
          width: 80,
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  // 年齢計算
  String _calculateAge(DateTime birthdate) {
    final now = DateTime.now();
    final age = now.year - birthdate.year;
    final monthDiff = now.month - birthdate.month;
    final dayDiff = now.day - birthdate.day;

    if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
      return '${age - 1}歳';
    }
    return '${age}歳';
  }

  // 削除確認ダイアログ
  void _showDeleteConfirmDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('削除の確認'),
            content: Text('${pet.name}を削除してもよろしいですか？\nこの操作は取り消せません。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('キャンセル'),
              ),
              FilledButton(
                onPressed: () async {
                  // 削除処理
                  await ref
                      .read(petsControllerProvider.notifier)
                      .remove(pet.localId);
                  if (context.mounted) {
                    Navigator.of(context).pop(); // ダイアログを閉じる
                    Navigator.of(context).pop(); // 詳細画面を閉じる
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${pet.name}を削除しました'),
                        backgroundColor: Colors.green,
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
