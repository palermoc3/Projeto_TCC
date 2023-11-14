class OnlineSerializer < ActiveModel::Serializer
  attributes :id, :packSize, :packPrice, :receive
  has_one :purchase
end
