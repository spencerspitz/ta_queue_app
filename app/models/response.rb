class Response < ApplicationRecord
    validates :comment, presence: true
    belongs_to :stack
end
