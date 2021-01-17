# テーブル設計

## users テーブル

| Column     | Type   | Options                  |
| ---------- | ------ | ------------------------ |
| email      | string | null: false unique: true |
| password   | string | null: false              |
| name       | string | null: false              |
| nickname   | string | null: false              |
| birthday   | string | null: false              |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| item name  | string     | null: false                    |
| text       | text       | null: false                    |
| category   | string     | null: false                    |
| condition  | string     | null: false                    |
| postage    | integer    | null: false                    |
| area       | string     | null: false                    |
| days       | string     | null: false                    |
| price      | integer    | null: false                    |
| exhibitor  | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buyer          | references | null: false, foreign_key: true |
| purchased item | references | null: false, foreign_key: true |

### Association

- has_many :addresses
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal code  | integer | null: false, foreign_key: true |
| prefecture   | string  | null: false, foreign_key: true |
| municipality | string  | null: false, foreign_key: true |
| address      | string  | null: false, foreign_key: true |
| number       | integer | null: false, foreign_key: true |

### Association

- belongs_to :purchase
