# frozen_string_literal: true

module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        class TagComponent < DSL::Components::Base
          attr_reader :measurement_id

          def initialize(measurement_id, **attributes, &block)
            @measurement_id = measurement_id
            super(type: :google_analytics_tag, **attributes, &block)
            expand!
          end
        end
      end
    end
  end
end
