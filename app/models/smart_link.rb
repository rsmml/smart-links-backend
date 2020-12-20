class SmartLink < ApplicationRecord
  belongs_to :user
  has_many :language_rules

  LANGUAGES = %w[ES DE EN]

  validates :name, presence: true, inclusion: { in: LANGUAGES }
  validates :url, presence: true
end
