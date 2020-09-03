#テーブル設計

usersテーブル
| Column           | Type   | Options                 |
| -----------------| ------ | ------------------------|
| nickname         | string | null: false             |
| email            | string | null: false             |
| password         | string | null: false             |
| birthday         | data   | null: false             |
| surname          | string | null: false             |
| name             | string | null: false             |
| phonetic_surname | string | null: false             |
| phonetic_name    | string | null: false             |

   Association
 - has_many : items
 - has_many : messages

 itemsテーブル
 | Column     | Type   | Options    |
 | -----------| ------ | -----------| 
 | name       | string | null:false |
 | text       | string | null:false |
 | price      | integer| null:false |
 | genre_id   | integer| null:false |
 | status_id  | integer| null:false |
 | bunder_id  | integer| null:false |
 | shipment_id| integer| null:false |
 | area_id    | integer| null:false |
 | user_id    | integer| null:false |
 

  Association
  - belongs_to_active_hash :genre
  - belongs_to_active_hash :status
  - belongs_to_active_hash :bunder
  - belongs_to_active_hash :shipment
  - belongs_to_active_hash :area
  - has_one_attached :image
  - belongs_to :user
  - has_one :address
  - has_one :order
  - has_many :messages

 addressテーブル
 | Column          | Type    | Options   |
 | ----------------| --------| ----------|
 | postal_cod      | string  | null:false|
 | cities          | string  | null:false|
 | address         | string  | null:false|
 | build_name      | string  | null:false|
 | phone number    | string  | null:false|
 | shipment_id     | integer | null:false|
 | item_id         | integer | null:false|

 Association
 - belongs_to : item

 ordersテーブル
 | Column | Type    | Options                     |
 | -------| --------| ----------------------------|
 | user_id| integer | null: false,foreign_key:true|
 | item_id| integer | null: false,foreign_key:true|

 Association
 - has_many : items
 
messagesテーブル
 | Column     | Type   | Options    |
 | -----------| ------ | -----------|
 | text       | string | null:false |
 | user_id    | integer| null:false |
 | item_id    | integer| null:false |

 Association
 - belongs_to :item
 - belongs_to :user

 