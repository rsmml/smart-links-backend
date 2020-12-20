class LanguageRule < ApplicationRecord
  belongs_to :smart_link

  LANGUAGES = %w[ES DE EN]

  validates :name, presence: true, inclusion: { in: LANGUAGES }
  validates :url, presence: true
end
