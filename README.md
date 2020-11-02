# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ------      | ----   | -------     |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| seimei      | string | null: false |
| seimei_kana | string | null: false |
| birthday    | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type        | Options                        |
| ------       | ----        | -------                        |
| name         | string      | null: false                    |
| text         | text        | null: false                    |
| category     | integer     | null: false                    |
| condition    | integer     | nill: false                    |
| shipping_fee | integer     | null: false                    |
| area         | integer     | null: false                    |
| day          | integer     | null: false                    |
| price        | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type         | Options                     |
| ------          | ----         | -------                     |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type         | Options                        |
| ------       | ----         | -------                        |
| postal_code  | string       | null: false                    |
| prefecture   | string       | null: false                    |
| city         | string       | null: false                    |
| house_number | string       | null: false                    |
| building     | string       |                                |
| phone_number | string       | null: false                    |
| purchase     | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase