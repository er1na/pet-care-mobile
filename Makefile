.PHONY: help seed seed-clear seed-pets seed-hospitals seed-vaccines seed-medicines seed-histories seed-diaries

# デフォルトターゲット: ヘルプを表示
help:
	@echo "🌱 シードデータ管理コマンド"
	@echo ""
	@echo "使い方: make [コマンド]"
	@echo ""
	@echo "利用可能なコマンド:"
	@echo "  make seed           - 全データを投入（ペット、病院、履歴など）"
	@echo "  make seed-clear     - 全データを削除"
	@echo "  make seed-pets      - ペットのみ投入"
	@echo "  make seed-hospitals - 病院のみ投入"
	@echo "  make seed-vaccines  - ワクチンのみ投入"
	@echo "  make seed-medicines - 薬のみ投入"
	@echo "  make seed-histories - 履歴のみ投入"
	@echo "  make seed-diaries   - 日記のみ投入"
	@echo ""
	@echo "例:"
	@echo "  make seed           # 全データを投入"
	@echo "  make seed-clear     # データをクリア"

# 全データを投入
seed:
	@echo "📥 全データを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=insert

# 全データを削除
seed-clear:
	@echo "🗑️  全データを削除します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=clear

# ペットのみ投入
seed-pets:
	@echo "🐾 ペットデータを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=pets

# 病院のみ投入
seed-hospitals:
	@echo "🏥 病院データを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=hospitals

# ワクチンのみ投入
seed-vaccines:
	@echo "💉 ワクチンデータを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=vaccines

# 薬のみ投入
seed-medicines:
	@echo "💊 薬データを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=medicines

# 履歴のみ投入
seed-histories:
	@echo "📋 履歴データを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=histories

# 日記のみ投入
seed-diaries:
	@echo "📝 日記データを投入します..."
	@flutter run -t lib/seed_runner.dart --dart-define=SEED_ACTION=diaries

# リセット＆投入（便利なエイリアス）
seed-reset: seed-clear seed
	@echo "✅ データをリセットして再投入しました！"
