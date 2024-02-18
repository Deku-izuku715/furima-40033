# README

## usersテーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| name                  | string | null: false |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false |
| password_confirmation | string | null: false |
| address               | string | null: false |
| nick_name             | string | null: false |
| birth_date            | string | null: false |
- has_many :items
- has_many :buy_records

## itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| items_image        | string | null: false |
| price              | string | null: false |
| put_user           | string | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| send_money         | string | null: false |
| send_region        | string | null: false |
| arrive_day         | string | null: false |
- belongs_to :user
- has_one :buy_records

## buy_recordsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| price              | string | null: false |
| buy_user           | string | null: false |
| review             | string | null: false |
- belongs_to :user
- has_one :send_reports

## send_reportsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| buy_user_address   | string | null: false |
| put_user           | string | null: false |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| phone_number       | string | null: false |
- has_one :buy_records