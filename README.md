## Users テーブル

| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| last_name          | string  | null: false |
| family_name_kana   | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :products
- has_many :purchase_records


## Products(商品)テーブル

| Column               | Type       | Option                        |
| -------------------  | ---------- | ----------------------------- |
| image                |            | null: false                   |
| name                 | string     | null: false                   |
| product_description  | text       | null: false                   |
| detail_category      | string     | null: false                   |
| product_condition    | string     | null: false                   |
| delivery_destination | string     | null: false                   |
| shipment_source      | string     | null: false                   |
| delivery_date        | integer    | null: false                   |
| price                | integer    | null: false                   |
| user                 | references | null: false, foreign_key:true |

### Association

- belongs_to  :user
- has_one : purchase_records

## Purchase_records(購入記録)テーブル

| Column     | Type       | Option                        |
| ---------- | ---------- | ----------------------------- |
| user_id    | references | null: false, foreign_key:true |
| content_id | references | null: false, foreign_key:true |

### Association

- belongs_to  :user
- has_one :product
- has_one :retailer

## Retailer(商品購入))テーブル

| Column           | Type     | Option      |
| ---------------- | -------- | ----------- |
| post_code        | integer  | null: false |
| prefectures      | string   | null: false |
| city             | string   | null: false |
| address          | integer  | null: false |
| build_name       | string   |             |
| phone_number     | integer  | null: false |

### Association

-  has_one :purchase_records