require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Wonder
  class Application < Rails::Application
    config.load_defaults 6.1
    config.assets.enabled = true
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }

    config.generators do |g|
      g.test_framework :rspec,
                       model_specs: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
    end
  end
end
