# README
<img width="1680" alt="スクリーンショット 2020-10-04 23 38 57" src="https://user-images.githubusercontent.com/64538711/95019371-f41c6380-069f-11eb-971a-44ea3ad3f410.png">
<img width="1677" alt="スクリーンショット 2020-10-04 23 39 40" src="https://user-images.githubusercontent.com/64538711/95019490-95a3b500-06a0-11eb-9dd9-93a05494238e.png">
<img width="1678" alt="スクリーンショット 2020-10-05 0 50 21" src="https://user-images.githubusercontent.com/64538711/95020253-06e56700-06a5-11eb-9396-b9d37b5d3b5c.png">

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.6.5
* Ruby on Rails version
  6.0.0
* System dependencies

* Configuration

* Database creation
  MySQL ver 0.4.4
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## florist テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |


## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |


### Association

- has_many :dear_persons



## dear_persons テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nick_name        | string     | null: false                    |
| family_name      | string     | null: false                    |
| last_name        | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| last_name_kana   | string     | null: false                    |
| birthday         | date       | null: false                    |
| anniversary      | date       | null: false                    |
| user_id          | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- has_one :payment
- has_one_attached :image


## plans テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| price        | integer   | null: false                    |
| style        | string    | null: false                    |
| dear_person  | refereces | foreign_key: true, null: false |


### Association

- belongs_to :dear_person
- has_one :payment
- has_one :address


## payments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------  | ------------------------------ |
| price        | references | foreign_key: true, null: false |
| user         | refereces  | foreign_key: true, null: false |

### Association

- belongs_to :dear_person
- belongs_to :plan
- belongs_to :address


## addresses テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| postal_code      | string    | null: false                    |
| city             | string    | null: false                    |
| house_number     | striing   | null: false                    |
| building_name    | striing   |                                |
| phone_number     | striing   | null: false                    |
| prefecture_id    | integer   | null: false                    |
| delivery_time_id | integer   | null: false                    |
| dear_person      | refereces | foreign_key: true, null: false |


### Association

- belongs_to :dear_person
- belongs_to :plan
- belongs_to :address


### Oters 

ActiveRecord
| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| image    |  string  | null: false | 


### Active::Hash
prefecture
delivery_time_id 
