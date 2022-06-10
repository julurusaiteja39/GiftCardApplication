class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 
    validates :password, confirmation: true
    #validates_format_of :email, with: A_MAGIC_REGEXP
    has_many:orders
end
