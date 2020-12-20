class SmartLink < ApplicationRecord
  belongs_to :user
  has_many :language_rules
end
