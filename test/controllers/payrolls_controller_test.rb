# frozen_string_literal: true

require 'test_helper'

class PayrollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payroll = payrolls(:one)
  end

  test 'should get index' do
    get payrolls_url, as: :json
    assert_response :success
  end

  test 'should create payroll' do
    assert_difference('Payroll.count') do
      post payrolls_url,
           params: { payroll: { commission: @payroll.commission, date_of_payroll: @payroll.date_of_payroll, description: @payroll.description, discount: @payroll.discount, employee_id: @payroll.employee_id, salary: @payroll.salary } }, as: :json
    end

    assert_response :created
  end

  test 'should show payroll' do
    get payroll_url(@payroll), as: :json
    assert_response :success
  end

  test 'should update payroll' do
    patch payroll_url(@payroll),
          params: { payroll: { commission: @payroll.commission, date_of_payroll: @payroll.date_of_payroll, description: @payroll.description, discount: @payroll.discount, employee_id: @payroll.employee_id, salary: @payroll.salary } }, as: :json
    assert_response :success
  end

  test 'should destroy payroll' do
    assert_difference('Payroll.count', -1) do
      delete payroll_url(@payroll), as: :json
    end

    assert_response :no_content
  end
end
