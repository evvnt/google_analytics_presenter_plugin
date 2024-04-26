require 'coprl/presenters/dsl/components/actions/base'

module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        class Action < DSL::Components::Actions::Base
          attr_reader :event_name,
                      :event_data

          def initialize(event_name, event_data, **attribs_, &block)
            super(type: :gtag_action, **attribs_, &block)
            @event_name = event_name
            @event_data = event_data
          end
        end
      end
    end
  end
end
