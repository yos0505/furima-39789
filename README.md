# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| name            | string    | null: false                    |
| description     | text      | null: false                    |
| category        | string    | null: false                    |
| condition       | string    | null: false                    |     
| shipping_charge | string    | null: false                    |  
| shipping_from   | string    | null: false                    |  
| shipping-day    | date      | null: false                    | 
| price           | integer   | null: false                    | 
| user            | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_cord      | integer    |                                |
| prefectures    | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| items          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

※クレジットカード情報はDBには保存しない。