#!/bin/bash

# シードデータ投入スクリプト
# 使い方: ./scripts/seed.sh [action]

ACTION=${1:-insert}

echo "🚀 シードデータツールを起動します..."
echo ""

case $ACTION in
  insert)
    echo "📥 全データを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=insert
    ;;
  clear)
    echo "🗑️  全データを削除します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=clear
    ;;
  pets)
    echo "🐾 ペットデータを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=pets
    ;;
  hospitals)
    echo "🏥 病院データを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=hospitals
    ;;
  vaccines)
    echo "💉 ワクチンデータを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=vaccines
    ;;
  medicines)
    echo "💊 薬データを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=medicines
    ;;
  histories)
    echo "📋 履歴データを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=histories
    ;;
  diaries)
    echo "📝 日記データを投入します"
    flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=diaries
    ;;
  help|--help|-h)
    echo "使い方: ./scripts/seed.sh [action]"
    echo ""
    echo "利用可能なアクション:"
    echo "  insert     - 全データを投入（デフォルト）"
    echo "  clear      - 全データを削除"
    echo "  pets       - ペットのみ投入"
    echo "  hospitals  - 病院のみ投入"
    echo "  vaccines   - ワクチンのみ投入"
    echo "  medicines  - 薬のみ投入"
    echo "  histories  - 履歴のみ投入"
    echo "  diaries    - 日記のみ投入"
    echo ""
    echo "例:"
    echo "  ./scripts/seed.sh              # 全データを投入"
    echo "  ./scripts/seed.sh insert       # 全データを投入"
    echo "  ./scripts/seed.sh clear        # 全データを削除"
    echo "  ./scripts/seed.sh pets         # ペットのみ投入"
    exit 0
    ;;
  *)
    echo "❌ 不明なアクション: $ACTION"
    echo ""
    echo "使い方: ./scripts/seed.sh [action]"
    echo "ヘルプ: ./scripts/seed.sh help"
    exit 1
    ;;
esac
