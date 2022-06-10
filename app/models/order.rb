class Order < ApplicationRecord
    belongs_to:user
    validates :mobile, presence: true, length: { minimum: 10 },length: { maximum: 10 }
end
