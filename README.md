## usersテーブル
| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| nickname       | string  | null: false               |
| email          | string  | null: false, unique: true |
| password       | string  | null: false               |
| family_name    | string  | null: false               |
| last-name      | string  | null: false               |
| j_family_name  | string  | null: false               |
| j_last_name    | string  | null: false               |
| birthday_year  | integer | null: false               |
| birthday_month | integer | null: false               |
| birthday_day   | integer | null: false               |

### Association
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :cards, dependent: :destroy


## user_reviewsテーブル
| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_review | integer | null: false                    |
| user_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to :user


## addressesテーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| family_name   | string  | null: false                    |
| last-name     | string  | null: false                    |
| j_family_name | string  | null: false                    |
| j_last_name   | string  | null: false                    |
| postal_code   | string  | null: false                    |
| prefectures   | string  | null: false                    |
| municipality  | string  | null: false                    |
| number        | string  | null: false                    |
| details       | string  |                                |
| phone_number  | integer | unique: true                   |
| user_id       | integer | null: false, foreign_key: true |

### Association
- belongs_to: user


## cardテーブル
| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| user_id     | integer | null: false |
| customer_id | string  | null: false |
| card_id     | integer | null: false |


### Association
- belongs_to :user


## itemsテーブル
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false                    |
| price           | integer | null: false                    |
| item_text       | text    | null: false                    |
| address         | string  | null: false                    |
| date            | string  | null: false                    |
| brand           | string  |                                |
| status          | string  |                                |
| delivery_charge | integer | null: false                    |
| size            | string  |                                |
| sold_out        | integer | null: false                    |
| user_id         | integer | null: false, foreign_key: true |
| category_id     | integer | null: false, foreign_key: true |

### Association
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- belongs_to :user
- belongs_to :category


## imagesテーブル
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| image   | string  | null: false                    |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :item


## commentsテーブル
| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| before_text | text    |                                |
| after_text  | text    |                                |
| item_id     | integer | null: false, foreign_key: true |
| user_id     | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## categoriesテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

### Association
- has_many :items
- has_ancestry


## favoritesテーブル
| Column   | Type    | Options     |
| -------- | ------  | ----------- |
| user_id  | integer | null: false |
| item_id  | integer |             |

### Association
- belongs_to :user
- belongs_to :item