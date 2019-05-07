class RoomSerializer < ActiveModel::Serializer
  attributes :id, :title, :user, :created_at, :updated_at, :room_messages

  belongs_to :user, exclude: :email
  has_one :category, exclude: :rooms
end
