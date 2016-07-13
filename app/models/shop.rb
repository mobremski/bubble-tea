class Shop < ActiveRecord::Base
  include PgSearch
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :user

  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :zip, presence: true, length: {is: 5}, numericality: true
  pg_search_scope :search_shop_only, against: [:name, :description]
  scope :search, -> (query) { search_shop_only(query) if query.present? }
end
