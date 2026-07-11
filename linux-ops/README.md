# LPIC102 Linux Operations

## 概要
LPIC102対策としてLinux運用スキルとシェルスクリプトを体系的にまとめたリポジトリ。

## 構成

- docs/ : 理論まとめ
- scripts/ : 実践スクリプト
- env/ : 環境設定

## 学習内容

### Shell
- testコマンド
- case文
- for文
- function
- alias

### Script
- 監視スクリプト
- ログ解析
- 自動化処理

## ポイント
- 実務を想定した構成
- 再利用可能な関数設計
- 可読性重視

## 実行方法

```bash
chmod +x scripts/*.sh
./scripts/health_check.sh
