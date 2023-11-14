# frozen_string_literal: true

class PayrollSerializer < ActiveModel::Serializer
  attributes :id, :date_of_payroll, :commission, :discount, :salary, :description
  has_one :employee
end
