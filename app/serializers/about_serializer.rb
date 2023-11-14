# frozen_string_literal: true

class AboutSerializer < ActiveModel::Serializer
  attributes :id, :about_text
  has_one :store
end
