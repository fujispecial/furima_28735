# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## userテーブル

| Column         | Type    | Options           |
| -------------- | ------- | ----------------- |
| nickname       | string  | null: false       |
| email          | string  | null: false       |
| password       | string  | null: false       |
| family_name    | string  | null: false       |
| first_name     | string  | null: false       |
| birth_date     | date    | null: false       |

### Association

- has_many: items
- has_many: buyers


## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_image     | string     | null: false                    |
| item_name      | string     | null: false                    |
| description    | string     | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| postage_id     | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| days_id        | integer    | null: false                    |
| price          | string     | null: false                    |
| user_id        | integer    | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: buyer
- belongs_to_active_hash: category
- belongs_to_active_hash: status
- belongs_to_active_hash: postage
- belongs_to_active_hash: prefectures
- belongs_to_active_hash: days

## buyersテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | integer    | null: false, foreign_key: true |
| item_id          | integer    | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| tel              | string     | null: false                    |
| buyer_id         | integer    | null: false, foreign_key: true |

### Association
- belongs_to: buyer
- belongs_to_active_hash: prefectures