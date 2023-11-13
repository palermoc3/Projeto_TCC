# frozen_string_literal: true

require 'test_helper'

class AunthenticationControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get aunthentication_login_url
    assert_response :success
  end

  test 'should get sign_up' do
    get aunthentication_sign_up_url
    assert_response :success
  end
end
