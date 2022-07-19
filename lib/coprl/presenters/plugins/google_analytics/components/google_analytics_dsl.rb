# frozen_string_literal: true

require_relative 'google_analytics_component'

module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        module DSLComponents
          def google_analytics(measurement_id, **attributes, &block)
            self << GoogleAnalytics::GoogleAnalyticsComponent.new(
              measurement_id,
              **attributes,
              parent: self,
              &block
            )
          end
        end
      end
    end
  end
end
