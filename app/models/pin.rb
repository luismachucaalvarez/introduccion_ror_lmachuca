class Pin < ApplicationRecord
  validates :name, :image, :description, presence:true
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy
end
