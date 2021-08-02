# Hugo app

## 概要

[Hugo](https://gohugo.io) による静的 web サイト構築のサンプルです。

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

### Hugo CLI ダウンロード

Windows ではターミナルの PowerShell で [dlhugo.ps1](dlhugo.ps1) を実行してください。

```console
> .\dlhugo.ps1
Downloading https://github.com/gohugoio/hugo/releases/download/v0.86.0/hugo_extended_0.86.0_Windows-64bit.zip
Extracting C:\Users\yaegashi\AppData\Local\Temp\adecca53-295c-4add-8c82-2dc6024a1231\hugo.zip
Copying hugo.exe to .\hugo.exe
```

PowerShell を使っていない場合、
またはセキュリティエラーが発生する場合は powershell.exe ごと実行してください。

```console
> powershell.exe -ExecutionPolicy Bypass .\dlhugo.ps1
```

macOS / Linux ではターミナルで [dlhugo.sh](dlhugo.sh) を実行してください。

```console
$ ./dlhugo.sh
Extracting hugo from https://github.com/gohugoio/hugo/releases/download/v0.86.0/hugo_extended_0.86.0_macOS-ARM64.tar.gz
x -rwxr-xr-x  0 root   root 47310258  7 21 20:04 hugo
```

hugo コマンドはカレントフォルダにダウンロードされ、ターミナルから直接実行できます。

### ローカルサーバ開発

ターミナルで次を実行すると Hugo サイトのビルドを行い
https://localhost:1313 でローカルサーバを立ち上げますので
web ブラウザで開いて確認してください。

```console
$ ./hugo serve -D
```

ローカルサーバ実行中に Hugo の記事のファイルを変更すると自動的な再ビルド・web ブラウザの更新を行います。

### ビルド

ターミナルで次を実行すると Hugo サイトのビルドを行い public フォルダに格納しますので
その内容を App Service 拡張機能などを用いて web サーバにデプロイしてください。

```console
$ ./hugo
```
