# frozen_string_literal: true

require 'rails_helper'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.automatic_label_click = true
end
