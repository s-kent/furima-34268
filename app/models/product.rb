class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_charges
  belongs_to :shipping_days
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :category_id
  end
  
  validates :price, numericality: true

end
