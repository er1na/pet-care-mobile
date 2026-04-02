# Pet Care Mobile

ペット（犬）の医療・体調管理アプリ

通院・ワクチン・服薬・日記を一元管理し、カレンダーで見返せるモバイルアプリケーション。

## 機能

- ペット情報管理
- 通院履歴の記録
- ワクチン接種履歴の管理
- 服薬履歴の管理
- ペット日記
- カレンダー表示
- リマインド通知（予定）

## 技術スタック

- **Flutter** - UIフレームワーク
- **Drift** - SQLiteデータベース（ローカルストレージ）
- **Riverpod** - 状態管理
- **table_calendar** - カレンダーUI

## 必要な環境

- Flutter SDK 3.7.2 以上
- Dart 3.7.2 以上
- iOS開発の場合: Xcode
- Android開発の場合: Android Studio

## セットアップ

### 1. リポジトリのクローン

```bash
git clone <repository_url>
cd pet_care_mobile
```

### 2. 依存関係のインストール

```bash
flutter pub get
```

### 3. Driftコード生成

データベース関連のコード（DAOクラスなど）を生成します：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**※ データベーススキーマを変更した場合は、必ずこのコマンドを実行してください。**

### 4. 開発中の自動コード生成（オプション）

ファイル変更を監視して自動的にコード生成する場合：

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## シードデータ投入（開発用）

開発・テスト用のサンプルデータを簡単に投入できます。

### 簡単な方法（推奨）

```bash
# 全データを投入（ペット5匹、病院3件、履歴、日記など）
make seed

# 全データを削除
make seed-clear

# データをリセットして再投入
make seed-reset

# 特定のデータのみ投入
make seed-pets        # ペットのみ
make seed-hospitals   # 病院のみ
make seed-vaccines    # ワクチンのみ
make seed-medicines   # 薬のみ
make seed-histories   # 履歴のみ
make seed-diaries     # 日記のみ

# ヘルプを表示
make help
```

### 投入されるデータ

- 🐾 ペット × 5匹（りん、レオン、ぷー、レオナ、ぽこ）
- 🏥 病院 × 3件
- 💉 ワクチン × 3種
- 💊 薬 × 3種
- 📋 通院・ワクチン・服薬履歴
- 📝 ペット日記 × 3件

## ビルド・実行方法

### iOS シミュレーター/実機で実行

```bash
flutter run -d ios
```

### Android エミュレーター/実機で実行

```bash
flutter run -d android
```

### デバイス一覧を確認

```bash
flutter devices
```

### リリースビルド

#### iOS

```bash
flutter build ios --release
```

#### Android（APK）

```bash
flutter build apk --release
```

#### Android（App Bundle）

```bash
flutter build appbundle --release
```

## プロジェクト構成

```
lib/
├── main.dart                 # エントリーポイント
├── core/
│   └── db/                  # データベース定義（Drift）
├── features/                # 機能ごとのモジュール
│   ├── pets/               # ペット管理
│   ├── hospitals/          # 病院マスタ
│   ├── medicine/           # 薬マスタ
│   ├── vaccines/           # ワクチンマスタ
│   ├── hospital_history/   # 通院履歴
│   ├── medicine_history/   # 服薬履歴
│   ├── vaccine_history/    # ワクチン履歴
│   └── pet_diary/          # ペット日記
└── ui/
    ├── screens/            # 画面
    └── widgets/            # 共通ウィジェット
```

各機能モジュールは以下の層で構成されています（Clean Architecture）：
- `domain/` - エンティティ、リポジトリインターフェース
- `infra/` - データアクセス層（DAO、リポジトリ実装）
- `application/` - アプリケーションロジック（コントローラー）

## トラブルシューティング

### Driftのコード生成エラーが出る場合

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### iOS ビルドエラーが出る場合

```bash
cd ios
pod install
cd ..
flutter run
```

## 開発状況

現在実装中の機能については、ソースコードを参照してください。

## ライセンス

このプロジェクトは個人利用を想定しています。
