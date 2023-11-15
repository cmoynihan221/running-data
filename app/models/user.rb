class User < ApplicationRecord
  has_many :activities, dependent: :delete_all
  has_many :comments
end 


