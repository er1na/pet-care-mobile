import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pet_care_mobile/core/db/seed_data.dart';
import 'package:pet_care_mobile/features/db_provider.dart';
import 'package:pet_care_mobile/features/pets/application/pets_controller.dart';
import 'package:pet_care_mobile/features/hospitals/application/hospital_controller.dart';
import 'package:pet_care_mobile/features/vaccines/application/vaccine_controller.dart';
import 'package:pet_care_mobile/features/medicine/application/medicine_controller.dart';
import 'package:pet_care_mobile/features/hospital_history/application/hospital_history_controller.dart';
import 'package:pet_care_mobile/features/vaccine_history/application/vaccine_history_controller.dart';
import 'package:pet_care_mobile/features/medicine_history/application/medicine_history_controller.dart';
import 'package:pet_care_mobile/features/pet_diary/application/pet_diary_controller.dart';
import 'package:pet_care_mobile/ui/screens/hospital_management_screen.dart';
import 'package:pet_care_mobile/ui/screens/vaccine_management_screen.dart';
import 'package:pet_care_mobile/ui/screens/medicine_management_screen.dart';

/// 設定画面
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
            Colors.white,
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // ヘッダー
          _buildHeader(context),
          const SizedBox(height: 12),
          // 通知設定
          _buildSection(
            context,
            title: '通知設定',
            icon: Icons.notifications_rounded,
            children: [
              _buildSwitchTile(
                context,
                title: '通院リマインド',
                subtitle: '通院予定の通知を受け取る',
                value: true,
                onChanged: (value) {
                  // TODO: 設定変更
                },
              ),
              _buildSwitchTile(
                context,
                title: 'ワクチンリマインド',
                subtitle: 'ワクチン予定の通知を受け取る',
                value: true,
                onChanged: (value) {
                  // TODO: 設定変更
                },
              ),
              _buildSwitchTile(
                context,
                title: '服薬リマインド',
                subtitle: '服薬時間の通知を受け取る',
                value: true,
                onChanged: (value) {
                  // TODO: 設定変更
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          // マスタデータ管理
          _buildSection(
            context,
            title: 'マスタデータ管理',
            icon: Icons.settings_outlined,
            children: [
              _buildTile(
                context,
                title: '病院管理',
                icon: Icons.local_hospital_rounded,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HospitalManagementScreen(),
                  ));
                },
              ),
              _buildTile(
                context,
                title: 'ワクチン管理',
                icon: Icons.vaccines_rounded,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VaccineManagementScreen(),
                  ));
                },
              ),
              _buildTile(
                context,
                title: '薬管理',
                icon: Icons.medication_rounded,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MedicineManagementScreen(),
                  ));
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.add_circle_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text('シードデータ登録'),
                subtitle: const Text('ペット、病院、履歴、日記などの完全なサンプルデータを登録'),
                onTap: () => _registerSeedData(context, ref),
              ),
              ListTile(
                leading: Icon(
                  Icons.cleaning_services_rounded,
                  color: Colors.orange.shade700,
                ),
                title: Text(
                  'データ全削除',
                  style: TextStyle(color: Colors.orange.shade700),
                ),
                subtitle: const Text('すべてのデータを削除（DBファイルは削除しない）'),
                onTap: () => _clearAllData(context, ref),
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
                title: const Text(
                  'データベースリセット',
                  style: TextStyle(color: Colors.red),
                ),
                subtitle: const Text('すべてのデータを削除してリセットします'),
                onTap: () => _resetDatabase(context),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // アプリ情報
          _buildSection(
            context,
            title: 'アプリ情報',
            icon: Icons.info_outline_rounded,
            children: [
              _buildTile(
                context,
                title: 'バージョン',
                subtitle: '1.0.0',
                icon: Icons.tag_rounded,
                onTap: () {},
              ),
              _buildTile(
                context,
                title: '利用規約',
                icon: Icons.description_outlined,
                onTap: () {
                  // TODO: 利用規約を表示
                },
              ),
              _buildTile(
                context,
                title: 'プライバシーポリシー',
                icon: Icons.privacy_tip_outlined,
                onTap: () {
                  // TODO: プライバシーポリシーを表示
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _resetDatabase(BuildContext context) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('確認'),
          content: const Text('すべてのデータが削除されます。\nこの操作は取り消せません。\n\n続行しますか？'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('キャンセル'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('リセット'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      try {
        // データベースファイルを削除
        final dir = await getApplicationDocumentsDirectory();
        final file = File(p.join(dir.path, 'pet_care.db'));

        if (await file.exists()) {
          await file.delete();
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('データベースをリセットしました。アプリを再起動してください。'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 5),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('エラー: $e'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }

  /// シードデータを登録
  Future<void> _registerSeedData(BuildContext context, WidgetRef ref) async {
    // 確認ダイアログ
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('シードデータ登録'),
          content: const Text(
            '以下のサンプルデータを登録します：\n\n'
            '• ペット × 5匹\n'
            '• 病院 × 3件\n'
            '• ワクチン × 3種\n'
            '• 薬 × 3種\n'
            '• 通院・ワクチン・服薬履歴\n'
            '• ペット日記\n\n'
            '続行しますか？',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('キャンセル'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('登録'),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    try {
      // ローディング表示
      if (context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('データを登録しています...'),
                      ],
                    ),
                  ),
                ),
              ),
        );
      }

      // シードデータを投入
      final db = ref.read(appDatabaseProvider);
      final seedData = SeedData(db);
      await seedData.insertAll();

      // プロバイダーをリフレッシュ
      ref.invalidate(petsControllerProvider);
      ref.invalidate(hospitalControllerProvider);
      ref.invalidate(vaccineControllerProvider);
      ref.invalidate(medicineControllerProvider);
      ref.invalidate(hospitalHistoryControllerProvider);
      ref.invalidate(vaccineHistoryControllerProvider);
      ref.invalidate(medicineHistoryControllerProvider);
      ref.invalidate(petDiaryControllerProvider);

      if (context.mounted) {
        Navigator.of(context).pop(); // ローディングを閉じる
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('シードデータを登録しました！'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop(); // ローディングを閉じる
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('エラー: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  /// 全データを削除
  Future<void> _clearAllData(BuildContext context, WidgetRef ref) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('確認'),
          content: const Text(
            'すべてのデータが削除されます。\n'
            '（DBファイル自体は削除されません）\n\n'
            'この操作は取り消せません。\n\n'
            '続行しますか？',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('キャンセル'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('削除'),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    try {
      // ローディング表示
      if (context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('データを削除しています...'),
                      ],
                    ),
                  ),
                ),
              ),
        );
      }

      // 全データを削除
      final db = ref.read(appDatabaseProvider);
      final seedData = SeedData(db);
      await seedData.clearAll();

      // プロバイダーをリフレッシュ
      ref.invalidate(petsControllerProvider);
      ref.invalidate(hospitalControllerProvider);
      ref.invalidate(vaccineControllerProvider);
      ref.invalidate(medicineControllerProvider);
      ref.invalidate(hospitalHistoryControllerProvider);
      ref.invalidate(vaccineHistoryControllerProvider);
      ref.invalidate(medicineHistoryControllerProvider);
      ref.invalidate(petDiaryControllerProvider);

      if (context.mounted) {
        Navigator.of(context).pop(); // ローディングを閉じる
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('すべてのデータを削除しました'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop(); // ローディングを閉じる
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('エラー: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.settings_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            '設定',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
