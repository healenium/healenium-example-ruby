# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Healing locators using semantic locators' do
  TEST_ENV_URL = 'https://healenium.github.io/healenium-test-env/index.html'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  it 'Find element by Id - Healing locators _1' do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }

    @driver.find_element(*by_for(:id, 'change_id')).send_keys('HLM_Semantic_#1')
    click_submit
    @driver.find_element(*by_for(:id, 'change_id')).send_keys('HLM_Semantic_#1')
  end

  it 'Find element by ClassName - Healing locators _2' do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }

    @driver.find_element(*by_for(:class_name, 'test_class')).send_keys('HLM_Semantic_#2')
    click_submit
    @driver.find_element(*by_for(:class_name, 'test_class')).send_keys('HLM_Semantic_#2')
  end

  it 'Find element by LinkText - Healing locators _3' do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }

    @driver.find_element(*by_for(:link_text, 'Change: LinkText, PartialLinkText')).send_keys('HLM_Semantic_#3')
    click_submit
    @driver.find_element(*by_for(:link_text, 'Change: LinkText, PartialLinkText')).send_keys('HLM_Semantic_#3')
  end

  it 'Find element by Name - Healing locators _4' do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }

    @driver.find_element(*by_for(:name, 'change_name')).send_keys('HLM_Semantic_#4')
    click_submit
    @driver.find_element(*by_for(:name, 'change_name')).send_keys('HLM_Semantic_#4')
  end

  it 'Find element by PartialLinkText - Healing locators _5' do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }

    @driver.find_element(*by_for(:partial_link_text, 'PartialLinkText')).send_keys('HLM_Semantic_#5')
    click_submit
    @driver.find_element(*by_for(:partial_link_text, 'PartialLinkText')).send_keys('HLM_Semantic_#5')
  end

  it 'Find element by TagName - Healing locators _6' do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }

    tag_element = @driver.find_element(*by_for(:tag_name, 'test_tag'))
    expect(tag_element.displayed?).to be true

    click_submit

    tag_element_after = @driver.find_element(*by_for(:tag_name, 'test_tag'))
    expect(tag_element_after.displayed?).to be true
  end
end
