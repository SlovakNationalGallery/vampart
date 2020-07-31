require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VampART
  class Application < Rails::Application
    config.autoload_paths += ["#{config.root}/lib", "#{config.root}/app/services"]

    config.action_dispatch.default_headers = {
      # Defaults
      # 'X-Frame-Options' => 'SAMEORIGIN',
      'X-XSS-Protection' => '1; mode=block',
      'X-Content-Type-Options' => 'nosniff',

      # Replacement for X-Frame-Options & allow embedding in slides.com
      'X-Content-Security-Policy' => "frame-ancestors 'self' https://slides.com",
    }
  end
end

require 'data_repository'
require 'basic_logger'
require 'data_repository'
require 'nasjonalmuseet'
require 'simple_threaded_downloader'
require 'webumenia'
