#テーブル設計

usersテーブル
| Column   | Type   | Options                 |
| -------- | ------ | ------------------------|
| Nickname | string | null: false             |
| email    | string | null: false,unique: true|
| password | string | null: false             |
| birthday | data   | null: false             |

   Association
- has_many : user_items
- has_many : items, through: user_items

itemsテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| product  | string | null: false |
| Exhibitor| string | null: false |
| category | string | null: false |
| price    | string | null: false |
| region   | string | null: false |
| shipment | date   | null: false |
| image    | text   | null: false |
| bunder   | string | null: false |

  Association
- has_many: user_items
- belongs_to : user, through: user_items
- belongs_to : addres

addressテーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| sipping_addres | string | null: false |
| prefeure_name  | string | null: false |
| postal cod     | string | null: false |
| phone number   | string | null: false |
| name           | string | null: false |
| birthday       | string | null: false |
  
  Association
- has_one : item

user_itemsテーブル
| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
|user_id         | references |null: false,foreign_key: true |
|items_id        | references |null: false,foreign_key: true |

  Association
- belongs_to : user
- belongs_to : items