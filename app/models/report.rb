# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :store

  def generate_employee_sales_report
    sales_report = []

    Employee.find_each do |employee|
      last_month_sales = employee.calculate_monthly_sales(Date.today)
      employee_data = {
        name: employee.name,
        last_month_sales: last_month_sales
      }
      sales_report << employee_data
    end

    sales_report
  end

  def self.generate_monthly_sales_report(store_id)
    current_date = Date.current
    end_date = current_date.beginning_of_month
    start_date = end_date - 11.months

    monthly_sales_data = []
    (start_date..end_date).each do |date|
      monthly_sales = calculate_monthly_sales(store_id, date)
      monthly_sales_data << { date: date, sales: monthly_sales }
    end

    monthly_sales_data
  end

  def self.calculate_monthly_sales(store_id, date)
    start_of_month = date.beginning_of_month
    end_of_month = date.end_of_month

    store = Store.find(store_id)

    # Assume que a associação entre Store e Employee é feita por meio de has_many :employees em Store
    store.employees.sum do |employee|
      employee.calculate_monthly_sales(start_of_month, end_of_month)
    end
  end
end
