module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        module Components
          class GtagEvent < DSL::Components::Base
            attr_reader :event_name, :event_data

            def initialize(event_name, event_data, **attribs_, &block)
              super(type: :gtag_event, **attribs_, &block)
              @event_name = event_name
              @event_data = event_data
              expand!
            end
          end
        end
      end
    end
  end
end
