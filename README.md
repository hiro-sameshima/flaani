# Flaani 
「花を扱うお店」と「顧客」をつなぐ をテーマに制作中のウェブアプリケーションです。

-README-  
<img width="1680" alt="スクリーンショット 2020-10-04 23 38 57" src="https://user-images.githubusercontent.com/64538711/95019371-f41c6380-069f-11eb-971a-44ea3ad3f410.png">

製作期間10日間
時間 80時間(1日8時間)

### 現在の実装機能
*ユーザー機能  <br>
*花屋さん側のユーザー機能(実装途中)
*大切な人を登録できる機能
*大切な人に贈る花束を購入する機能


<img width="1672" alt="スクリーンショット 2020-10-05 1 04 40" src="https://user-images.githubusercontent.com/64538711/95020558-ddc5d600-06a6-11eb-9892-448b724c5a19.png">
#### 追加予定の機能はIssuesに記載します。


<img width="1610" alt="スクリーンショット 2020-10-05 0 52 01" src="https://user-images.githubusercontent.com/64538711/95020288-31372480-06a5-11eb-9f32-c9f231b95084.png">

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
