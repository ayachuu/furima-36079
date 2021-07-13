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
| category_id             | string     | null: false                   |
| condition_id            | string     | null: false                   |
| delivery_destination_id | string     | null: false                   |
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

## Retailer(商品購入))テーブル

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