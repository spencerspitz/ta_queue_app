class Request < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :desc, presence: true
    
    validates_format_of :email, :with => /@colgate.edu/
end
