# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'CSS 1 Locator Tests' do
  CALLBACK_URL = 'https://mdn.github.io/web-components-examples/life-cycle-callbacks/'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  it 'Update locator for element with css attribute' do
    @driver.get(CALLBACK_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until do
      @driver.find_element(:css, 'button[class*="add"]').displayed?
    end

    add_square_btn = @driver.find_element(:css, 'button[class*="add"]')
    expect(add_square_btn.displayed?).to be true
    add_square_btn.click

    square_element = @driver.find_element(:css, 'custom-square[color="red"]')
    expect(square_element.displayed?).to be true

    2.times do
      update_square_btn = @driver.find_element(:css, 'button[class*="update"]')
      expect(update_square_btn.displayed?).to be true
      update_square_btn.click

      healed_square = @driver.find_element(:css, 'custom-square[color="red"]')
      expect(healed_square.displayed?).to be true
    end
  end
end
