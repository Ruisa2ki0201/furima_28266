#テーブル設計

usersテーブル
| Column           | Type   | Options                 |
| -----------------| ------ | ------------------------|
| Nickname         | string | null: false             |
| email            | string | null: false,unique: true|
| password         | string | null: false             |
| birthday         | data   | null: false             |
| surname          | string | null: false             |
| name             | string | null: false             |
| phonetic_surname | string | null: false             |
| phonetic_name    | string | null: false             |

   Association
 - has_many : items
 - has_many : controls

 itemsテーブル
 | Column             | Type   | Options    |
 | -------------------| ------ | -----------| 
 | name               | string | null: false|
 | image              | text   | null: false|
 | category           | string | null: false|
 | price              | integer| null: false|
 | date_of_shipment_id| integer| null: false|
 | spping_region_id    | integer| null: false|
 | bunder_id          | integer| null: false|
 | product_status_id  | integer| null: false|

  Association
 - belongs_to : user
 - has_one : address
 - has_many : controls
 - has_many : categorys

 addressテーブル
 | Column       | Type   | Options    |
 | -------------| ------ | -----------|
 | postal_cod   | string | null: false|
 | cities       | string | null: false|
 | address      | string | null: false|
 | building name| string | null: false|
 | phone number | string | null: false|

 Association
 - belongs_to : item

 controlテーブル
 | Column | Type      | Options                     |
 | -------| ----------| ----------------------------|
 | user_id| references| null: false,foreign_key:true|
 | item_id| references| null: false,foreign_key:true|

 Association
 - has_many : users
 - has_many : items

 categoryテーブル
 | Column    | Type      | Options                      |
 | ----------| ----------| -----------------------------|
 |category_id| references|null: false,foreign_key: true |

 Association
 - belongs_to : item
