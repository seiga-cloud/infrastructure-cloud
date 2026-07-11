# LPIC102 Shell Script Practice

## 概要
LPIC-102のシェルおよびシェルスクリプトの学習内容を、
実務レベルで再現することを目的としたリポジトリです。

## 目的
- シェルスクリプトの基礎理解
- 実務を想定した自動化スクリプトの作成
- GitHubでのアウトプット強化

## 技術要素
- bash
- Linuxコマンド
- cron（定期実行）

## ディレクトリ構成
- docs/：知識まとめ
- scripts/：実務スクリプト
- cron/：自動化設定

## 実行方法
```bash
chmod +x scripts/*.sh
./scripts/log_monitor.sh
今後の改善
AWS（EC2）での実行
Slack通知連携
エラーハンドリング強化

---

# 📚 docs/shell-basics.md（知識まとめ）

```md
# Shell Basics（LPIC-102）

## testコマンド
- -e：存在確認
- -f：通常ファイル
- -d：ディレクトリ

## 数値比較
- -gt：>
- -ge：>=
- -lt：<
- -le：<=
- -eq：=
- -ne：!=

## if文
条件分岐に使用

## case文
複数条件分岐に最適

## for文
繰り返し処理

## while文
条件ループ
