class User < ApplicationRecord
  has_secure_password
  has_many :smart_links

  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }
end
