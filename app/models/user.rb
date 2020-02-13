class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
