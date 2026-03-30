# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'General Locator API Tests' do
  TEST_ENV_URL = 'https://healenium.github.io/healenium-test-env/index.html'

  before(:all) { @driver = Healenium::Selenium::DriverFactory.chrome }

  after(:all) { @driver&.quit }

  before(:each) do
    @driver.get(TEST_ENV_URL)
    Selenium::WebDriver::Wait.new(timeout: 15).until { @driver.find_element(:id, 'main_form').displayed? }
  end

  def wait_for_alert_and_accept(timeout: 3)
    Selenium::WebDriver::Wait.new(timeout: timeout).until do
      @driver.switch_to.alert
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      false
    end
    @driver.switch_to.alert.accept
  end


  it 'Button click with FindBy annotation' do
    @driver.find_element(:id, 'submit_alert').click
    wait_for_alert_and_accept(timeout: 30)

    @driver.find_element(:id, 'change_id').click

    click_submit

    @driver.find_element(:id, 'change_id').click
  end

  it 'Input fields click with FindBy annotation' do
    test_class_el = @driver.find_element(:class_name, 'test_class')
    expect(test_class_el.displayed?).to be true
    test_class_el.send_keys("\n")

    test_tag_el = @driver.find_element(:id, 'change_element')
    expect(test_tag_el.displayed?).to be true
    test_tag_class = test_tag_el.attribute('class')
    expect(test_tag_class).to eq('shadow-input1')

    change_name_el = @driver.find_element(:name, 'change_name')
    expect(change_name_el.displayed?).to be true

    link_el = @driver.find_element(:link_text, 'Change: LinkText, PartialLinkText')
    expect(link_el.displayed?).to be true
    link_class = link_el.attribute('class')
    expect(link_class).to eq('input1')

    click_submit

    healed_test_class = @driver.find_element(:class_name, 'test_class')
    expect(healed_test_class.displayed?).to be true
    healed_test_class.send_keys("\n")

    healed_test_tag = @driver.find_element(:id, 'change_element')
    expect(healed_test_tag.displayed?).to be true
    expect(healed_test_tag.attribute('class')).to eq(test_tag_class)

    healed_change_name = @driver.find_element(:name, 'change_name')
    expect(healed_change_name.displayed?).to be true
    healed_change_name.send_keys("\n")

    healed_link = @driver.find_element(:link_text, 'Change: LinkText, PartialLinkText')
    expect(healed_link.displayed?).to be true
    expect(healed_link.attribute('class')).to eq(link_class)
  end

  it 'Checkbox verify with FindBy annotation' do
    expect(@driver.find_element(:id, 'form_checked1').displayed?).to be true
    expect(@driver.find_element(:id, 'form_checked2').displayed?).to be true
    expect(@driver.find_element(:id, 'form_checked3').displayed?).to be true

    click_submit_checkbox

    expect(@driver.find_element(:id, 'form_checked1').displayed?).to be true
    expect(@driver.find_element(:id, 'form_checked2').displayed?).to be true
    expect(@driver.find_element(:id, 'form_checked3').displayed?).to be true
  end

  it 'Input field enable to disable with FindBy annotation' do
    enabled_el = @driver.find_element(:id, 'change_enabled')
    expect(enabled_el.displayed?).to be true
    expect(enabled_el.enabled?).to be true

    click_submit

    disabled_el = @driver.find_element(:id, 'change_enabled')
    expect(disabled_el.displayed?).to be true
    expect(disabled_el.enabled?).to be false
  end

  it 'Checkbox checked to unchecked with FindBy annotation' do
    checked_el = @driver.find_element(:id, 'change_checked')
    expect(checked_el.displayed?).to be true
    expect(checked_el.selected?).to be true

    click_submit

    unchecked_el = @driver.find_element(:id, 'change_checked')
    expect(unchecked_el.displayed?).to be true
    expect(unchecked_el.selected?).to be false
  end
end
