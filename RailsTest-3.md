# 20200328 Memo
自分が作成したオリジナルページをサイトのトップページにするためには
コントローラとビューを作成する必要がある。

__コントローラの設定__

まずは事前準備として下記、内容のファイルを以下ファイルパスに保存する必要があるようです。（理由不明）
>/rails/asagao/config/initializers/generators.rb

>Rails.application.config.generators do |g|
  g.helper false
  g.assets false
  g.skip_routes true
  g.test_framework false
end

ファイルが用意できたら、Railsアプリケーションのフォルダ配下に移動して、
以下のコマンドを実行するようです。

>rails g controller top index

このコマンドを実行すると、/app/controllersフォルダ配下に
top_controller.rbというファイルが生成されます。

中身は以下のように記述されている。

> class TopController < ApplicationController
  def index
  end
end

1行目にRubyのクラス定義が記載されているが、コントローラはRubyのクラスで表現される。
上記は　TopController が ApplicationControllerクラスを継承する形で定義されているが、
メソッドとして、indexが定義されている。これがRailsのいわゆる「アクション」になる。
indexはトップページを表示するための「アクション」となる。

## コントローラとアクションの結びつけ（ルーティング設定）

先ほどのRails gコマンドの実行により、コントローラとアクションは生成されたが、
それだけでは、Railsアプリケーションのページにならない。
URLパスとコントローラを結びつけるルーティングを設定する必要がある。

以下、パスに保存されているroutes.rbを編集する必要がある。

__config/routes.rb__

編集した後に以下のようになっていれば良い。

>Rails.application.routes.draw do
  root "top#index"
 end

## ビューの作成(見た目の変更)
indexアクションはトップページを呼び出すためのメソッド(アクション)であった。
このindexアクションに対応するビュー(トップページのUI)を編集する。

__app/view/top__

ファイル名は`index.html.erb`となっており、"index"の部分はアクション名が紐づいている。

