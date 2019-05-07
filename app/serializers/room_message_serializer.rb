class RoomMessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :room_id
  belongs_to :user
end
