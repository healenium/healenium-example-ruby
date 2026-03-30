# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Parent-Child Locator API Tests' do
  TEST_ENV_URL = 'https://healenium.github.io/healenium-test-env/index.html'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  before(:each) do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }
  end

  # :first-child / :last-child are CSS pseudo-classes—use :css.
  it 'Select and verify several inputs CSS FirstChild' do
    first_child = @driver.find_element(:css, 'test_tag:first-child')
    expect(first_child.displayed?).to be true

    click_submit

    healed_first_child = @driver.find_element(:css, 'test_tag:first-child')
    expect(healed_first_child.displayed?).to be true
  end

  it 'Select and verify several inputs CSS LastChild' do
    last_child = @driver.find_element(:css, 'child_tag:last-child')
    expect(last_child.displayed?).to be true

    click_submit

    healed_last_child = @driver.find_element(:css, 'child_tag:last-child')
    expect(healed_last_child.displayed?).to be true
  end
end
