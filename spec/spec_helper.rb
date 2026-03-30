# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'selenium-webdriver'
require 'healenium/selenium/driver_factory'
require_relative 'support/driver_helpers'

module SpecLocator
  VALID_KINDS = %i[
    xpath css id class_name link_text name partial_link_text tag_name
  ].freeze

  def by_for(kind, locator)
    sym = kind.to_sym
    unless VALID_KINDS.include?(sym)
      raise ArgumentError, "unsupported locator kind: #{kind.inspect}"
    end
    if locator.nil? || locator.to_s.empty?
      raise ArgumentError, "locator cannot be blank for #{sym.inspect}"
    end

    [sym, locator.to_s]
  end
end

RSpec.configure do |config|
  config.include SpecLocator
  config.include DriverHelpers
end
