class Category < ApplicationRecord
  has_many :doctors, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
