# Hugo app

## 概要

Hugo による静的 web サイト構築のサンプルです。

## `dlhugo.ps1` / `dlhugo.sh`

最新版の Hugo extended の CLI コマンドを
[GitHub Release](https://github.com/gohugoio/hugo/releases)
から自動的にダウンロードするスクリプトです。

Windows では PowerShell のターミナルで [dlhugo.ps1](dlhugo.ps1) を実行してください。

```console
> .\dlhugo.ps1
Downloading https://github.com/gohugoio/hugo/releases/download/v0.86.0/hugo_extended_0.86.0_Windows-64bit.zip
Extracting C:\Users\yaegashi\AppData\Local\Temp\adecca53-295c-4add-8c82-2dc6024a1231\hugo.zip
Copying hugo.exe to .\hugo.exe
```

macOS / Linux ではターミナルで [dlhugo.sh](dlhugo.sh) を実行してください。

```console
$ ./dlhugo.sh
Extracting hugo from https://github.com/gohugoio/hugo/releases/download/v0.86.0/hugo_extended_0.86.0_macOS-ARM64.tar.gz
x -rwxr-xr-x  0 root   root 47310258  7 21 20:04 hugo
```

hugo コマンドはカレントフォルダに配置され、ターミナルから直接実行できます。

次を実行すると hugo のバージョンが確認できます。

```console
$ ./hugo version
hugo v0.86.0-41C6C52E+extended darwin/arm64 BuildDate=2021-07-21T09:53:14Z VendorInfo=gohugoio
```

次を実行すると https://localhost:1313 にローカルサーバが立ち上がります。
web ブラウザで開いて確認してください。

```console
$ ./hugo serve -D
```

次を実行するとサイトのビルドを行い public フォルダに格納します。
その内容を web サーバにデプロイしてください。

```console
$ ./hugo
```
