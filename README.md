# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false unique: true |
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| last-name          | string | null: false              |
| first-name         | string | null: false              |
| last-name-kana     | string | null: false              |
| first-name-kana    | string | null: false              |
| nickname           | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal code     | string     | null: false, foreign_key: true |
| prefecture_id   | string     | null: false, foreign_key: true |
| municipality_id | string     | null: false, foreign_key: true |
| address_id      | string     | null: false, foreign_key: true |
| building_id     | string     | foreign_key: true              |
| phone-number    | string     | null: false, foreign_key: true |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
