# frozen_string_literal: true

require 'test_helper'

class AnalysesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get analyses_new_url
    assert_response :success
  end
end
