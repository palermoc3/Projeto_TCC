# frozen_string_literal: true

class StoreSerializer < ActiveModel::Serializer
  attributes :id, :kind, :theme, :payroll_day
  has_one :administrator
end
