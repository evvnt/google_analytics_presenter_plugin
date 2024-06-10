require "digest/sha1"
require "coprl/presenters/dsl/components/actions/base"

module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        class Action < DSL::Components::Actions::Base
          attr_reader :event_name, :event_data, :signature

          def initialize(event_name, event_data, once: false, **attribs_, &block)
            super(type: :gtag_action, **attribs_, &block)
            @event_name = event_name
            @event_data = event_data
            @signature = once ? generate_signature : nil
          end

          private

          def generate_signature
            Digest::SHA1.hexdigest("#{@event_name}_#{JSON.generate(@event_data)}")
          end
        end
      end
    end
  end
end
