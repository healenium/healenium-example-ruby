# frozen_string_literal: true

module Healenium
  module Selenium
    PROXY_URL = ENV.fetch('HEALENIUM_PROXY_URL', 'http://localhost:8085')

    module DriverFactory
      module_function

      def chrome
        options = ::Selenium::WebDriver::Chrome::Options.new
        options.add_argument('--no-sandbox')
        options.add_argument('--disable-dev-shm-usage')
        ::Selenium::WebDriver.for(:remote, url: PROXY_URL, options: options)
      end

      def firefox
        options = ::Selenium::WebDriver::Firefox::Options.new
        ::Selenium::WebDriver.for(:remote, url: PROXY_URL, options: options)
      end
    end
  end
end
