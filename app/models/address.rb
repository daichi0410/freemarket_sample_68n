class Address < ApplicationRecord
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :last_name, presence: true
  validates :j_family_name, presence: true
  validates :j_last_name, presence: true
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :municipality, presence: true
  validates :number, presence: true
  validates :phone_number, presence: true
end
