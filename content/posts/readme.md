---
title: "サイト構築手順"
date: 2021-08-03T09:51:00+09:00
---
## 構築手順

Windows / macOS / Linux での Hugo によるサイト構築手順を説明します。

### 環境整備

作業環境としては [Visual Studio Code](https://code.visualstudio.com/) を使用することをおすすめします。
コマンドの実行には Visual Studio Code の統合ターミナルを使用してください。

Git コマンドが必要になりますのでインストールしておいてください。

### サブモジュール

ターミナルで次を実行して Hugo テーマ (themes/ananke) のサブモジュールをチェックアウトしてください。

```console
$ git submodule init
$ git submodule update
```

以下略
