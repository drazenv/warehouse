class Assembly < ApplicationRecord
  belongs_to :article
  belongs_to :product

  validates :amount_of, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_uniqueness_of :id, scope: [:article_id, :product_id]
end
