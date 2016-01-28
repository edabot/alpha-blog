class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
                      uniqueness: {case_sensitive: false},
                      length: { minimum: 3, maximum: 50 }
  VALID_USER_REGEX = /@/i
  validates :email, presence:true, length: { maximum: 125 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_USER_REGEX }
end