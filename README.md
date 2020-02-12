## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|last-name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|user_review|integer|null: false|

### Association
- has_many :items
- has_many :comments
- belongs_to :address


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
|address|string|null: false|
|details|string||
|phone_number|string||

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|integer|null: false|
|image1|string|null: false|
|image2|string||
|image3|string||
|image4|string||
|image5|string||
|image6|string||
|address|string|null: false|
|date|string|null: false|
|bland|string||
|status|string||
|delivery_charge|integer|null: false|
|size|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :big_categories
- belongs_to :user
- belongs_to :category


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|before_text|string||
|after_text|string||
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## big_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false|

### Association
- has_many :middle_category
- belongs_to :items


## middle_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|big_category_id|integer|null: false, foreign_key: true|

### Association
- has_many :small_categories
- belongs_to :big_category


## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|middle_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :middle_category