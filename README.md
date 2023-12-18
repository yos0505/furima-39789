# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
|  email             | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |     
| shipping_charge_id | integer    | null: false                    |  
| shipping_from_id   | integer    | null: false                    |  
| shipping_day_id    | integer    | null: false                    | 
| price              | integer    | null: false                    | 
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

※imageはActiveStorageで実装するため含まない。

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_cord        | string     | null: false                    |
| shipping_from_id | integer    | null: false                    |
| city             | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

※クレジットカード情報はDBには保存しない。
