# README

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nick_name             | string | null: false |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_date            | date   | null: false |
- has_many :items
- has_many :buy_records

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_describe      | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| send_cost_id       | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| arrive_day_id      | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
- belongs_to :user
- has_one :buy_record

## addressesテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| street_address    | string     | null: false                    |
| construction_name | string     |                                |
| phone_number      | string     | null: false                    |
| buy_record        | references | null: false, foreign_key: true |
- belongs_to :buy_record

## buy_recordsテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |
- belongs_to :user
- belongs_to :item
- has_one :address