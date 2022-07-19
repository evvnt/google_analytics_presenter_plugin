# frozen_string_literal: true

require 'dry-configurable'
require_relative 'google_analytics/web_client/components/google_analytics_render'
require_relative 'google_analytics/components/google_analytics_dsl'

module Coprl::Presenters::Plugins::GoogleAnalytics
  class Settings
    extend Dry::Configurable

    setting :measurement_id
  end

  class Error < StandardError; end
end
