# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'CSS 2 Locator Tests' do
  TEST_ENV_URL = 'https://healenium.github.io/healenium-test-env/index.html'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  before(:each) do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }
  end

  it 'Update locator for element with css id with special character' do
    change_name_element = @driver.find_element(:id, 'change:name')
    expect(change_name_element.displayed?).to be true

    click_submit

    healed_change_name = @driver.find_element(:id, 'change:name')
    expect(healed_change_name.displayed?).to be true
  end

  it 'Update locator for element with css Element' do
    test_tag_element = @driver.find_element(:tag_name, 'test_tag')
    expect(test_tag_element.displayed?).to be true

    click_submit

    healed_test_tag = @driver.find_element(:tag_name, 'test_tag')
    expect(healed_test_tag.displayed?).to be true
  end

  it 'Update locator for element with css Disabled' do
    disabled_element = @driver.find_element(:css, 'input:disabled')
    expect(disabled_element.displayed?).to be true

    click_submit

    healed_disabled = @driver.find_element(:css, 'input:disabled')
    expect(healed_disabled.displayed?).to be true
  end

  it 'Update locator for element with css Enabled' do
    enabled_element = @driver.find_element(:css, 'textarea:enabled')
    expect(enabled_element.displayed?).to be true

    click_submit

    healed_enabled = @driver.find_element(:css, 'textarea:enabled')
    expect(healed_enabled.displayed?).to be true
  end

  it 'Update locator for element with css ClassName' do
    test_class_element = @driver.find_element(:class_name, 'test_class')
    expect(test_class_element.displayed?).to be true

    click_submit

    healed_test_class = @driver.find_element(:class_name, 'test_class')
    expect(healed_test_class.displayed?).to be true
  end
end
