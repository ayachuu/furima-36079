# アプリ名
  フリマアプリ
# 概要
 - TechCamp 学習内で作成したクローンアプリ
 - 追加実装として、アプリケーションには基本実装に近い「いいね機能」を実装しています。
 - 追加実装として、「プレビュー機能」を実装し、新規登録や編集時に添付したい画像があっているか確認んできるようにしました。

# 本番環境
https://furima-36079.herokuapp.com/

ID: admin  
Pass: 7777

 - テスト用アカウント等
購入者用  
メールアドレス: aaa@aaa.jp  
パスワード: asdf1234

 - 購入用カード情報  
番号：4242424242424242  
期限：本日より未来の年月  
セキュリティコード：123

 - 出品者用  
メールアドレス名: bbb@bbb.jp  
パスワード: lkjh0987  

- Githubリポジトリ  
https://github.com/ayachuu/furima-36079.git


# 動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
- ただしデプロイ等で接続できないタイミングもございます。  
- その際は少し時間をおいてから接続してください。  
- 接続先およびログイン情報については、上記の通りです。  
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。  
- 「テストアカウントでログイン」→「トップページから出品ボタン押下」→
「商品情報入力」→「商品出品」
確認後、ログアウト処理をお願いします。


  
# 制作背景（意図）
 - 10週間の学習で学んだことを思い出しながら、作成すること
 - 追加実装を行い、経験を積みたかったこと
  
# DEMO：詳細説明
### トップページ
[![Image from Gyazo](https://i.gyazo.com/8c1b88ed522df0f4bd30ab9548a5f57f.gif)](https://gyazo.com/8c1b88ed522df0f4bd30ab9548a5f57f)
 - ヘッダー左上のロゴはクリックするとトップページに遷移する  
 - 出品されている画像をスリックすると詳細ページに遷移する  
 全てのページに対応
 - 右下のカメラマークから出品する
 - 新規登録していないユーザー、未ログイン状態でも閲覧可能
 - 新規登録していないユーザー、未ログイン状態の場合、「ログイン」「新規登録」の表示がされる
 - ログインしている場合は、「ユーザー名」「ログアウト」が表示される


### ログインページ
[![Image from Gyazo](https://i.gyazo.com/06569fd8273a51f1a623217f18b8beb2.png)](https://gyazo.com/06569fd8273a51f1a623217f18b8beb2)

 - 誤入力がある場合、エラー内容が表示される
### 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/1cbc52c11fbd0f66f43ef3412d36d1e0.png)](https://gyazo.com/1cbc52c11fbd0f66f43ef3412d36d1e0)
 - 半角英数字や文字数などの制限が設けてあり、誤入力があるとエラー内容が表示される
 - また、入力された内容に間違いがない部分は反映されている
 - 「新規登録」を押すとトップページに遷移する
### 商品出品画面
[![Image from Gyazo](https://i.gyazo.com/be355a933c17b88fe6bb2c7131eb33a4.gif)](https://gyazo.com/be355a933c17b88fe6bb2c7131eb33a4)
 - 各項目、入力必須
 - 誤入力や未入力があるとエラー内容が表示される
 - 「出品する」から商品を登録し、トップページに遷移する
 - 「戻る」ボタンを押すことでトップページに戻る

### 詳細表示画面
[![Image from Gyazo](https://i.gyazo.com/6d38ea5874c213825eea97d2858c3a25.jpg)](https://gyazo.com/6d38ea5874c213825eea97d2858c3a25)
 - 出品者の場合は、「編集」と「削除」ボタンが表示される
 - 「編集」ボタンで編集画面へ遷移する
 - 「削除」ボタンで削除することができる
 - 出品者以外の場合は、「購入」ボタンが表示される
 

### 編集・削除画面
[![Image from Gyazo](https://i.gyazo.com/c60836ffe3bc2ff138273d12dd4ada55.gif)](https://gyazo.com/c60836ffe3bc2ff138273d12dd4ada55)
 - 登録した時の内容が反映されている
 - 画像のみ反映されない
 - 各項目変更可能
 - 「変更する」ボタンで編集されトップページに遷移する
 - 「戻る」をクリックするとトップページに遷移する
### 購入機能
[![Image from Gyazo](https://i.gyazo.com/6bcecbb2c0edb2e839915c157b206970.gif)](https://gyazo.com/6bcecbb2c0edb2e839915c157b206970)
 - PAY.JPを使用し購入機能を実装

### 追加実装１
[![Image from Gyazo](https://i.gyazo.com/415ddef5e835c052d8bfcb07b45bae89.gif)](https://gyazo.com/415ddef5e835c052d8bfcb07b45bae89)
 - 商品に「いいね」機能を実装
 - 新規登録していないユーザー、未ログイン、出品者本人の場合は「いいね！の数」のみ表示され、クリックしても反映されない
 - 上記以外の場合、クリックすると数が増える
 - 一度クリックしたら、表示が「いいね！を外す」に変わり、何度もいいねができないようになっている
 - 現段階では、同期通信でのいいね！機能  
 今後、非同期通信での実装を行う予定である

### 追加実装２
[![Image from Gyazo](https://i.gyazo.com/2d3daaaff15d1c9b4dcbd9c4226dbe70.png)](https://gyazo.com/2d3daaaff15d1c9b4dcbd9c4226dbe70)
 - 商品の出品時、また編集にて画像を変更する時にプレビューを表示



### 学んだこと、工夫したこと
 1. 最終課題ではメンターへの質問が限られており、なるべく利用せず、分からないことや疑問に思ったことを自分なりに整理し考え、実行して修正するように心がけました。  
 メンター利用は、その自分なりの考えが正しいかどうかをアウトプット利用したことで、理解を深めると共に、＋αの情報を得ることができました。
 2. 自分で追加実装したい内容を調べコードを記述しましたが、思う通りの挙動とはならず、またエラー画面が出ないためなかなか原因を見つけることができず問題解決ができませんでした。  
 ここから、できることを把握し、諦めて違う方法を試してみるということも大切だと学ぶことができました。
 3. Trelloにより、タスク管理を行いました。  
 大まかに予定を組んでいましたが、スムーズに実装できた時・できなかった時それぞれで、状況確認をし、作業を細分化し直したことで終了予定よりも早く実装を終えることができました。自分の状況を客観視し、焦らずに実装に取り組めたように感じます。



# 使用技術（開発環境）
 ### バックエンド
 Ruby,Ruby on Rails
 ### フロントエンド
 HTML,CSS,Java Script
 ### データベース
 Sequel pro, MySQL
 ### インフラ
 AWS(EC2)、API
 ### Webサーバー（本番環境）
 Heroku
 ### ソース管理
 GitHub, GitHubDesctop
 ### テスト
 RSpec
 ### エディタ
 VSCode
# 課題や今後実装したい機能
 - プレビューで表示する画像が１００％のサイズになってしまっている点
 - いいね！機能を非同期通信での実装

 上記、2点を課題に今後も取り組みたいと思っています。
# DB設計
## Users テーブル

| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| family_name        | string  | null: false               |
| last_name          | string  | null: false               |
| family_name_kana   | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :products
- has_many :purchase_records


## Products(商品)テーブル

| Column                  | Type       | Option                        |
| ----------------------  | ---------- | ----------------------------- |
| name                    | string     | null: false                   |
| description             | text       | null: false                   |
| category_id             | integer    | null: false                   |
| condition_id            | integer    | null: false                   |
| delivery_destination_id | integer    | null: false                   |
| prefecture_id           | integer    | null: false                   |
| delivery_date_id        | integer    | null: false                   |
| price                   | integer    | null: false                   |
| user                    | references | null: false, foreign_key:true |

### Association

- belongs_to  :user
- has_one : purchase_record

## Purchase_records(購入記録)テーブル

| Column     | Type       | Option                        |
| ---------- | ---------- | ----------------------------- |
| user       | references | null: false, foreign_key:true |
| product    | references | null: false, foreign_key:true |

### Association

- belongs_to  :user
- belongs_to :product
- has_one :retailer

## Retailers(商品購入))テーブル

| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| post_code        | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| build_name       | string     |                               |
| phone_number     | string     | null: false                   |
| purchase_record  | references | null: false, foreign_key:true |


### Association

-  belongs_to :purchase_record