class RoomMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :room_id, :created_at
  belongs_to :user
end
