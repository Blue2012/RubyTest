# 20200401Memo

## 命名規則
Railsの原則の１つは「設定より規約」

モデル、コントローラ、ビューに関連するクラス名やファイル名には、命名規約、つまり、名前の付け方に決まり事がある。

コントローラ名を「members」とした場合のコントローラやビューに関する名前は次のようになる。

```
コントローラクラス名：MembersController
ルール：〇〇Controller(先頭は大文字にする)
```

```
コントローラファイル名：Members_controler.rb
ルール：〇〇_controller.rb
```

```
テンプレートフォルダ名：app/views/members
ルール：app/views/〇〇
```

```
テストスクリプトのファイル名：members_controller_test.rb
ルール：〇〇_controller_test.rb
```

## モデルの命名規則

```
データベーステーブル名:members
ルール：先頭、小文字、複数形にする
```

```
モデルクラス名：Member
ルール：先頭は大文字
```

```
モデルクラスのファイル名：members.rb
ルール：〇〇.rb
```

```
テストスクリプトのファイル名：member_test.rb
ルール：〇〇_test.rb
```

## 全コントローラに共通の機能を作成する場合

ApplicationController.rbファイルに記載されているApplicationControllerクラスに
メソッドを加えれば、全てのコントローラに共通の機能を作成可能になる。

## アクションで利用可能な機能

以下のコマンドでコントローラを追加する。

```
rails g controller lesson
```
routes.rbファイルを開いて、endの前に以下の行を追加する。

/lesson/アクション名というパスでLessonControllerの全アクションを呼び出せるようにしている。
また、:nameという名前のパラメータを利用可能。

```
Rails.application.routes.draw do
    root "top#index"
    get "about" => "top#about", as: "about"
    get "lesson/:action(/:name)" => "lesson"
end
```
