class Stack < ApplicationRecord
    validates :user, presence: true
    validates :topic, presence: true
    validates :coscclass, presence: true
    validates :comment, presence: true
    has_many :responses, dependent: :destroy
    
end
