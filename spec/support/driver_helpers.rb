# frozen_string_literal: true

module DriverHelpers
  def click_submit
    @driver.find_element(:id, 'Submit').click
  end

  def click_submit_checkbox
    @driver.find_element(:id, 'Submit_checkbox').click
  end
end
