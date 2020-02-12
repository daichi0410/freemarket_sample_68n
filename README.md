## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|last-name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :cards, dependent: :destroy


## user_reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_review|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|last-name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|number|string|null: false|
|details|string||
|phone_number|integer|unique: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to: user


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|card_year|integer|null: false|
|card_month|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|item_text|text|null: false|
|address|string|null: false|
|date|string|null: false|
|bland|string||
|status|string||
|delivery_charge|integer|null: false|
|size|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :comments, dependent: :destroy
- has_many :big_categories
- belongs_to :user
- belongs_to :image, dependent: :destroy
- belongs_to :category


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|before_text|text||
|after_text|text||
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|ancestry|string||

### Association
- has_many :items