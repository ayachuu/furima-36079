## Users テーブル

| Column           | Type    | Option      |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name(kana) | string  | null: false |
| last_name(kana)  | string  | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items
- has_one :card
- has_one :retailer
- has_one :card

## Retailer(購入先)テーブル

| Column           | Type     | Option      |
| ---------------- | -------- | ----------- |
| post_code        | integer  | null: false |
| prefectures      | string   | null: false |
| municipalities   | string   | null: false |
| address          | integer  | null: false |
| build_name       | string   |             |
| phone_number     | integer  | null: false |

### Association

- has_one :user

## Cards(クレジットカード))テーブル

| Column           | Type     | Option      |
| ---------------- | -------- | ----------- |
| card_number      | integer  | null: false |
| expiration_date  | integer  | null: false |
| security_code    | integer  | null: false |

### Association

- has_one :user

## Items(商品)テーブル

| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| item_description | text       | null: false                   |
| item_category    | string     | null: false                   |
| shipping_charge  | string     | null: false                   |
| shipment_source  | string     | null: false                   |
| date             | integer    | null: false                   |
| user_id          | references | null: false, foreign_key:true |

### Association

- belongs_to  :user
- has_many :images

## Images(画像)テーブル

| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| image   |            | null: false                   |
| item_id | references | null: false, foreign_key:true |

### Association

- belongs_to  :item