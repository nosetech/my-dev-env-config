# my-dev-config

Linux 環境における nvim+tmux+etc などの開発環境のインストール、設定について記載する。

## zsh

## tmux

## tig

## nvim

- packer install

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

vi で実行

```
:PackerInstall
```

Windows(wsl)の場合,Telescope で以下のエラーが出る

```
packer.nvim: Error running config for telescope-frecency.nvim: ...im/site/pack/packer/start/sqlite.lua/lua/sqlite/defs.lua:55: libsqlite3.so: cannot open shared object file: No such file or directory
```

対処

1. plugins.lua 内の tami5/sqlite.lua を kkharji/sqlite.lua に置き換える
2. sudo apt-get install sqlite3 libsqlite3-dev

### coc の拡張機能のインストール

インストールコマンド

```
:CocInstall パッケージ名(スペース区切りで複数指定可)
```

インストールされている拡張機能の確認

```
:CocList extensions
```

1. coc-json
2. coc-yaml
3. coc-tsserver
4. coc-prettier
5. coc-eslint
6. coc-jedi
7. coc-docker
8. coc-diagnostic
9. coc-markdown-preview-enhanced (require coc-webview)
10. coc-webview

coc-jedi について  
coc-settings.json の以下の部分で、jedi-language-server のパスを修正

```
"jedi.executable.command":⋅"/home/nosetech/.local/bin/jedi-language-server",
```
