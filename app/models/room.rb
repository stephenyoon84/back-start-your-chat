class Room < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :room_messages
end
