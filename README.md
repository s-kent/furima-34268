  users テーブル

|Column             |Type    | Options     |
|-----------------  |------- |-------------|
| nickname          | string | null: false |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |


-has_many :products
-has_many :comments


   products テーブル

|Column               |Type               |Options   |
|---------------------|-------------------|----------| 
| product_name        | string            | null: false |
| description         | text              | null: false |
| price               | data              | null: false |
| status_id           | integer           | null: false |
| shipping_charges_id | integer           | null: false |
| shipping_area_id    | integer           | null: false |
| shipping_days_id    | integer           | null: false |
| category_id         | integer           | null: false |
| user                | references        | null: false, foreign_key: true |

-belongs_to :user
-has_many :comments


   destination テーブル

|Column        |Type    |Options      |
|--------------|--------|-------------| 
| postal_code  | string | null: false |
| prefecture_id| integer| null: false |
| city         | string | null: false |
| address      | string | null: false |
| building     | string |-------------|
| phone_number | string | null: false |
| purchase_management | references | null: false, foreign_key: true |


-belongs_to :purchase management



   comments テーブル

|Column  |Type        |Options                         |
|------- |------------|--------------------------------| 
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |


-belongs_to :user
-belongs_to :product


   purchase management テーブル

|Column   |Type        |Options                         |
|---------|------------|--------------------------------| 
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

-has_many :users
-has_many :products
