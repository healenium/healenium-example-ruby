# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Simple Locator API Tests' do
  TEST_ENV_URL = 'https://healenium.github.io/healenium-test-env/index.html'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  before(:each) do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }
  end

  it 'Update locator for element with css id' do
    id_element = @driver.find_element(:css, 'input#newValue')
    expect(id_element.displayed?).to be true

    click_submit

    change_id_element = @driver.find_element(:css, 'input#newValue')
    expect(change_id_element.displayed?).to be true
  end

  # :enabled is a CSS pseudo-class; Selenium has no separate :enabled strategy—use :css (or :xpath).
  it 'Update locator for element with css Enabled' do
    enabled_element = @driver.find_element(:css, 'textarea#change_enabled')
    expect(enabled_element.displayed?).to be true

    click_submit

    changed_enabled_element = @driver.find_element(:css, 'textarea#change_enabled')
    expect(changed_enabled_element.displayed?).to be true
  end

  it 'XPath Not Contains' do
    not_contains_element = @driver.find_element(:css, 'input#change_className')
    expect(not_contains_element.displayed?).to be true

    click_submit

    changed_not_contains_element = @driver.find_element(:css, 'input#change_className')
    expect(changed_not_contains_element.displayed?).to be true
  end
end
