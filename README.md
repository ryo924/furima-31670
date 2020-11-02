# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ------     | ----   | -------     |
| nickname   | string | null: false |
| e-mail     | string | null: false |
| password   | string | null: false |
| user_name1 | string | null: false |
| user_name2 | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------       | ----       | -------                        |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | nill: false                    |
| shipping_fee | string     | null: false                    |
| area         | string     | null: false                    |
| day          | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column          | Type         | Options                     |
| ------          | ----         | -------                     |
| user            | references   | null: false, foreign_key: true |
| item            | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column       | Type         | Options                        |
| ------       | ----         | -------                        |
| postal_code  | string       | null: false                    |
| prefecture   | string       | null: false                    |
| city         | string       | null: false                    |
| house_number | string       | null: false                    |
| building     | string       | null: false                    |
| phone_number | string       | null: false                    |
| purchase     | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchases