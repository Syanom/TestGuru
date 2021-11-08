class Category < ApplicationRecord
  default_scope { order(:name) }

  has_many :tests, dependent: :destroy

  validates :name, presence: true
end
