class Request < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :desc, presence: true
end
