# 中古本買ってRailsを勉強してみた記録（インストールからRails起動まで）
ひとまず、先頭から順に一通り、やってみようとおもう。
RubyとRailsのバージョンはそれぞれ以下の通り。
実行環境はMacです。

```
Ruby:ruby 2.7.0p0
Rails:Rails 6.0.2.2
```

## Railsアプリケーションの作成
RubyとRailsのインストール手順は割愛します。

```
mkdir rails
cd rails
```

Railsでアプリケーションを作成するには`rails new 〜`で良いみたいですが、
本の中でbundleコマンドの動作を別で確認するためにあえて、スキップしているみたいです。

```
rails new asagao --skip-bundle
```

アプリケーションのディレクトリが作成されるので、そっちに移動して、
bundleコマンドを実行するようです。

```
bundle install
```
## Railsアプリケーションの起動

rails newコマンドでアプリケーションを作成したら、
以下のコマンドでアプリケーションを起動することができる。

```
bin/rails s
```

と本には記載されていたのだが、エラーが発生してしまった。

```
in `rescue in load': Webpacker configuration file not found /Users/*****/Desktop/RubyTest/rails/asagao/config/webpacker.yml. Please run rails webpacker:install Error: No such file or directory @ rb_sysopen - /Users/*****/Desktop/RubyTest/rails/asagao/config/webpacker.yml (RuntimeError)
```

てなわけで、気を取り直して、以下のコマンドを実行してみる。

```
rails webpacker:install
```

また、こいつもエラーでコケるんですね。
困ったもんですよ。

Qiitaの記事に以下の内容がアップされていたので、こちらを参考に対処してみました。
<参考>https://qiita.com/sanriyochan/items/52780af6a9d77d8a14ba

以下のファイル（webpacker.yml）を強制的に作成するのと、
あと、yarnコマンドもインストールしておく必要があるようです。

```
brew install yarn
```

ちなみに以下のコマンドを実行する際にはRailsアプリケーションのフォルダ直下で実行するようです。

```
rails webpacker:install
```

```
# Note: You must restart bin/webpack-dev-server for changes to take effect

default: &default
  source_path: app/javascript
  source_entry_path: packs
  public_root_path: public
  public_output_path: packs
  cache_path: tmp/cache/webpacker
  check_yarn_integrity: false
  webpack_compile_output: true

  # Additional paths webpack should lookup modules
  # ['app/assets', 'engine/foo/app/assets']
  resolved_paths: []

  # Reload manifest.json on all requests so we reload latest compiled packs
  cache_manifest: false

  # Extract and emit a css file
  extract_css: false

  static_assets_extensions:
    - .jpg
    - .jpeg
    - .png
    - .gif
    - .tiff
    - .ico
    - .svg
    - .eot
    - .otf
    - .ttf
    - .woff
    - .woff2

  extensions:
    - .mjs
    - .js
    - .sass
    - .scss
    - .css
    - .module.sass
    - .module.scss
    - .module.css
    - .png
    - .svg
    - .gif
    - .jpeg
    - .jpg

development:
  <<: *default
  compile: true

  # Verifies that correct packages and versions are installed by inspecting package.json, yarn.lock, and node_modules
  check_yarn_integrity: true

  # Reference: https://webpack.js.org/configuration/dev-server/
  dev_server:
    https: false
    host: localhost
    port: 3035
    public: localhost:3035
    hmr: false
    # Inline should be set to true if using HMR
    inline: true
    overlay: true
    compress: true
    disable_host_check: true
    use_local_ip: false
    quiet: false
    pretty: false
    headers:
      'Access-Control-Allow-Origin': '*'
    watch_options:
      ignored: '**/node_modules/**'


test:
  <<: *default
  compile: true

  # Compile test packs to a separate directory
  public_output_path: packs-test

production:
  <<: *default

  # Production depends on precompilation of packs prior to booting for performance.
  compile: false

  # Extract and emit a css file
  extract_css: true

  # Cache manifest.json for performance
  cache_manifest: true
```

上記までが終わった段階で改めて、以下のコマンドを実行して、Railsアプリケーションを起動してみます。

```
bin/rails s
```

私の場合、これで起動しました。

## 用語の整理
Gem(RubyGems)：
　Ruby言語のためのパッケージマネージャー。
　Ruby関連のソフトウェアをインストール、アップデートする際に利用。
Bundler:
　Gemパッケージの管理とインストールのためのツール。
　パッケージバージョンとその依存関係の整合性を保つために利用する。

## bundleコマンドのオプション
オプションには↓のようなものがあるとのこと。

bundle list
 →必要なGemパッケージをすべて一覧表示する。
bundle check
 →必要なGemパッケージがインストールされているか全チェックする。
  インストールされている場合、以下のような文字が出力される。
```
The Gemfile's dependencies are satisfied
```
bundle update
 →Gemfile.lockを無視して、GemfileをもとにGemパッケージをインストールし直し、
  Gemfile.lockを作成し直す。
