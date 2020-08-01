#テーブル設計

usersテーブル
| Column   | Type   | Options                 |
| -------- | ------ | ------------------------|
| Nickname | string | null: false             |
| email    | string | null: false,unique: true|
| password | string | null: false             |
| birthday | data   | null: false             |
| surname  | string | null: false             |
| name     | string | null: false             |
| phonetic | string | null: false             |

   Association
 - has_many : items
 - belongs_to : item

 itemsテーブル
 | Column          | Type   | Options    |
 | ----------------| ------ | -----------| 
 | prodcut_name    | string | null: false|
 | image           | text   | null: false|
 | category        | string | null: false|
 | price           | integer| null: false|
 | date of shipment| string | null: false|
 | spping region   | string | null: false|
 | bunder          | string | null: false|
 | product status  | string | null: false|

  Association
 - belongs_to : user
 - has_one : address
 - belongs_to : user

 addressテーブル
 | Column       | Type   | Options    |
 | -------------| ------ | -----------|
 | postal_cod   | string | null: false|
 | cities       | string | null: false|
 | address      | string | null: false|
 | building name| string | null: false|

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
