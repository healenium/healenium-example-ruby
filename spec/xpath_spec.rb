# frozen_string_literal: true

require 'spec_helper'

# Mirrors com.epam.healenium.tests.XpathTest (TEST_ENV): openPage → findElement(xpath) →
# clickSubmitButton → findElement(xpath) again. No Enter / alerts.
RSpec.describe 'XPath Locator API Tests' do
  TEST_ENV_URL = 'https://healenium.github.io/healenium-test-env/index.html'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  before(:each) do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }
  end

  it 'XPath with special characters' do
    @driver.find_element(:xpath, "//*[@id='change:name']")
    click_submit
    @driver.find_element(:xpath, "//*[@id='change:name']")
  end

  it 'XPath Following' do
    @driver.find_element(:xpath, "//*[@id='change_className']/following::test_tag")
    click_submit
    @driver.find_element(:xpath, "//*[@id='change_className']/following::test_tag")
  end

  it 'XPath Contains' do
    @driver.find_element(:xpath, "//input[contains(@class, 'test')]")
    click_submit
    @driver.find_element(:xpath, "//input[contains(@class, 'test')]")
  end

  it 'XPath Not Contains' do
    @driver.find_element(:xpath, "//input[not(contains(@class, 'input1'))]")
    click_submit
    @driver.find_element(:xpath, "//input[not(contains(@class, 'input1'))]")
  end

  it 'XPath Following-Sibling' do
    @driver.find_element(:xpath, "//*[starts-with(@class, 'test')]/following-sibling::*")
    click_submit
    @driver.find_element(:xpath, "//*[starts-with(@class, 'test')]/following-sibling::*")
  end

  it 'XPath Ancestor::' do
    xpath = "(//*[starts-with(@class, 'test')]/ancestor::div[@class='healenium-form validate-form']//input)[1]"
    @driver.find_element(:xpath, xpath)
    click_submit
    @driver.find_element(:xpath, xpath)
  end

  it 'XPath OR' do
    @driver.find_element(:xpath, "//*[@id='change_id' or @id='omg']")
    click_submit
    @driver.find_element(:xpath, "//*[@id='change_id' or @id='omg']")
  end

  it 'XPath And' do
    @driver.find_element(:xpath, "//*[@id='change_id' and @type='text']")
    click_submit
    @driver.find_element(:xpath, "//*[@id='change_id' and @type='text']")
  end

  it 'XPath Starts-with' do
    @driver.find_element(:xpath, "//*[starts-with(@class, 'test')]")
    click_submit
    @driver.find_element(:xpath, "//*[starts-with(@class, 'test')]")
  end

  it 'XPath Precending::' do
    @driver.find_element(:xpath, "//*[@id='change_className']/preceding::*[@id='change_id']")
    click_submit
    @driver.find_element(:xpath, "//*[@id='change_className']/preceding::*[@id='change_id']")
  end

  it 'XPath Descendant::' do
    @driver.find_element(:xpath, "//*[@id='descendant_change']/descendant::input")
    click_submit
    @driver.find_element(:xpath, "//*[@id='descendant_change']/descendant::input")
  end

  it 'XPath Hover' do
    # Empty in XpathTest#testXpathHover
  end
end
