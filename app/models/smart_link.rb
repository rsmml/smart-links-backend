class SmartLink < ApplicationRecord
  belongs_to :user
  has_many :language_rules, dependent: :destroy

  validates :name, presence: true
  validates :url, presence: true
end
