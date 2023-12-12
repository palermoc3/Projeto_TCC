# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :user
  has_many :payrolls
  after_create :update_user_role
  after_update :update_user_role

  validates :ctps, numericality: { only_integer: true }, length: { is: 10 }
  validates :salary_base, numericality: { greater_than: 0, message: 'Deve ser maior que zero' }
  validates :commission_per_cent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  def calculate_monthly_sales
    Sale.where(employee_id: id,
               created_at: (1.month.ago.beginning_of_month..1.month.ago.end_of_month))
        .sum(:amount)
  end

  def self.create_daily_payrolls
    today = Date.today
    store_payroll_day = Store.pluck(:payroll_day)

    Employee.find_each do |employee|
      employee.create_daily_payroll(today) if today.day == store_payroll_day
    end
  end

  private

  def create_daily_payroll(today)
    last_month_sales = calculate_monthly_sales(today)

    Payroll.create(
      date_of_payroll: today,
      commission: calculate_commission(last_month_sales),
      salary: salary_base + calculate_commission(last_month_sales),
      employee_id: id
    )
  end

  def calculate_commission
    commission_rate = commission_per_cent
    last_month_sales * (commission_rate / 100.0)
  end

  def update_user_role
    user.update(role: 2) if user.present?
  end
end
