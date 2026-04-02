import 'package:flutter/material.dart';
import 'package:pet_care_mobile/core/db/drift_database.dart';
import 'package:pet_care_mobile/core/db/seed_data.dart';

/// シードデータ投入用のコマンドラインツール
///
/// 使い方:
/// ```bash
/// # シードデータを投入
/// flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=insert
///
/// # 全データを削除
/// flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=clear
///
/// # アクションを指定しない場合はinsertが実行される
/// flutter run -t lib/seed_runner.dart
/// ```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final action = const String.fromEnvironment(
    'SEED_ACTION',
    defaultValue: 'insert',
  );

  print('🌱 シードデータツール起動');
  print('アクション: $action');
  print('');

  try {
    final db = AppDatabase();
    final seedData = SeedData(db);

    switch (action) {
      case 'insert':
        print('📥 シードデータを投入しています...');
        await seedData.insertAll();
        print('✅ シードデータの投入が完了しました！');
        print('');
        print('投入されたデータ:');
        print('  • ペット × 5匹');
        print('  • 病院 × 3件');
        print('  • ワクチン × 3種');
        print('  • 薬 × 3種');
        print('  • 通院・ワクチン・服薬履歴');
        print('  • ペット日記 × 3件');
        break;

      case 'clear':
        print('🗑️  全データを削除しています...');
        await seedData.clearAll();
        print('✅ 全データの削除が完了しました！');
        break;

      case 'pets':
        print('🐾 ペットデータのみを投入しています...');
        await seedData.insertPets();
        print('✅ ペットデータの投入が完了しました！');
        break;

      case 'hospitals':
        print('🏥 病院データのみを投入しています...');
        await seedData.insertHospitals();
        print('✅ 病院データの投入が完了しました！');
        break;

      case 'vaccines':
        print('💉 ワクチンデータのみを投入しています...');
        await seedData.insertVaccines();
        print('✅ ワクチンデータの投入が完了しました！');
        break;

      case 'medicines':
        print('💊 薬データのみを投入しています...');
        await seedData.insertMedicines();
        print('✅ 薬データの投入が完了しました！');
        break;

      case 'histories':
        print('📋 履歴データのみを投入しています...');
        await seedData.insertHistories();
        print('✅ 履歴データの投入が完了しました！');
        break;

      case 'diaries':
        print('📝 日記データのみを投入しています...');
        await seedData.insertDiaries();
        print('✅ 日記データの投入が完了しました！');
        break;

      default:
        print('❌ 不明なアクション: $action');
        print('');
        print('利用可能なアクション:');
        print('  • insert     - 全データを投入（デフォルト）');
        print('  • clear      - 全データを削除');
        print('  • pets       - ペットのみ投入');
        print('  • hospitals  - 病院のみ投入');
        print('  • vaccines   - ワクチンのみ投入');
        print('  • medicines  - 薬のみ投入');
        print('  • histories  - 履歴のみ投入');
        print('  • diaries    - 日記のみ投入');
        break;
    }

    await db.close();
  } catch (e, stackTrace) {
    print('❌ エラーが発生しました: $e');
    print('');
    print('スタックトレース:');
    print(stackTrace);
  }

  print('');
  print('👋 処理を終了します');
}
