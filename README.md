  users テーブル

|Column             |Type    | Options  |
|-----------------  |------- |--------  |
| nickname          | string | NOT NULL |
| email             | string | NOT NULL, unique: true|
| encrypted_password| string | NOT NULL |
| last_name         | string | NOT NULL |
| first_name        | string | NOT NULL |
| last_name_kana    | string | NOT NULL |
| first_name_kana   | string | NOT NULL |
| birthday          | date   | NOT NULL |


-has_many :products
-has_many :comments


   products テーブル

|Column           |Type               |Options   |
|-----------------|-------------------|----------| 
| product_name    | string            | NOT NULL |
| description     | string            | NOT NULL |
| price           | string            | NOT NULL |
| status          | string            | NOT NULL |
| shipping_charges| string            | NOT NULL |
| shipping_area   | string            | NOT NULL |
| shipping_days   | string            | NOT NULL |
| category        | string            | NOT NULL |
| user_id         | integer           | NOT NULL, foreign_key: true |

-belongs_to :user
-has_many :comments


   destination テーブル

|Column        |Type    |Options   |
|--------------|--------|----------| 
| postal_code  | string | NOT NULL |
| prefecture   | string | NOT NULL |
| city         | string | NOT NULL |
| address      | string | NOT NULL |
| building     | string |----------|
| phone_number | string | NOT NULL |


-belongs_to :user



   comments テーブル

|Column |Type        |Options                         |
|-------|------------|--------------------------------| 
| text  | text       |NOT NULL                        |
| user  | references | null: false, foreign_key: true |


-belongs_to :user
-belongs_to :product


   purchase management テーブル

|Column      |Type     |Options                      |
|------------|---------|-----------------------------| 
| user_id    | integer | NOT NULL, foreign_key: true  |
| product_id | integer | NOT NULL, foreign_key: true |
