class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"} 
    validates :password, confirmation: true
    #validates_format_of :email, with: A_MAGIC_REGEXP
    has_many:orders
end
