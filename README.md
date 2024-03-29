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
-has_many :purchase_managements


   products テーブル

|Column               |Type               |Options   |
|---------------------|-------------------|----------| 
| name                | string            | null: false |
| description         | text              | null: false |
| price               | integer           | null: false |
| status_id           | integer           | null: false |
| shipping_charges_id | integer           | null: false |
| prefecture_id       | integer           | null: false |
| shipping_days_id    | integer           | null: false |
| category_id         | integer           | null: false |
| user                | references        | null: false, foreign_key: true |

-belongs_to :user
-has_many :comments
-has_one :order


   destination テーブル

|Column        |Type    |Options      |
|--------------|--------|-------------| 
| postal_code  | string | null: false |
| prefecture_id| integer| null: false |
| city         | string | null: false |
| address      | string | null: false |
| building     | string |-------------|
| phone_number | string | null: false |
| order        | references | null:false, foreign_key: true |


-belongs_to :order


   order テーブル

|Column   |Type        |Options                         |
|---------|------------|--------------------------------| 
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |



-belongs_to :user
-belongs_to :product
-has_one :destination


   comments テーブル

|Column  |Type        |Options                         |
|------- |------------|--------------------------------| 
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| product| references | null: false, foreign_key: true |


-belongs_to :user
-belongs_to :product
