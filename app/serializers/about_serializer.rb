# frozen_string_literal: true

class AboutSerializer < ActiveModel::Serializer
  attributes :id, :about_text, :title
  # attribute :photo_info
  # def photo_info
  #  {
  #    filename: object.photo.filename
  #  }
  # end
end
