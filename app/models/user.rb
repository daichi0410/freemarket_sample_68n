class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # accepts_nested_attributes_for :address
  validates :nickname, presence: true
  validates :encrypted_password, presence: true
  validates :family_name, presence: true
  validates :last_name, presence: true
  validates :j_family_name, presence: true
  validates :j_last_name, presence: true
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  devise :validatable, password_length: 7..128


  has_one :address

  has_many :items, dependent: :destroy
  has_many :cards
  has_many :favorites, dependent: :destroy
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 6 }
end
