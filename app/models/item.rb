class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :name, presence: true
  validates :price, presence: true
  validates :item_text, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :delivery_charge, presence: true
  validates :sold_out, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true


end
