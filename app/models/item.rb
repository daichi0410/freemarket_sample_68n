class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :name, presence: true
  validates :price, presence: true
  validates :item_text, presence: true
  validates :prefecture_id, presence: true
  validates :date, presence: true
  validates :delivery_charge, presence: true
  validates :sold_out, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true


  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments
  
  def self.search(search)
    return Item.all unless search
    Item.where('text LIKE(?)', "%#{search}%")
  end

  def favorited_by?(user) #いいねしているかどうか
    favorites.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
