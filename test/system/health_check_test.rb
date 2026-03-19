require "application_system_test_case"

class HealthCheckTest < ApplicationSystemTestCase
  test "up endpoint responds" do
    visit "/up"

    assert_equal 200, page.status_code
  end
end
