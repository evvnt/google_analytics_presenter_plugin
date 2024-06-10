# frozen_string_literal: true

require_relative 'google_analytics/components/gtag_event'
require_relative 'google_analytics/components/tag_component'
require_relative 'google_analytics/action'
require_relative 'google_analytics/render'

module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        module DSLComponents
          def google_analytics(measurement_id, **attributes, &block)
            self << Components::TagComponent.new(
              measurement_id,
              **attributes,
              parent: self,
              &block
            )
          end

          def create_ga_event(event_name, event_data, **attributes, &block)
            self << Components::GtagEvent.new(
              event_name,
              event_data,
              **attributes,
              parent: self,
              &block
            )
          end
        end

        module DSLEventActions
          def trigger_ga_event(event_name, event_data, once: false, **attributes, &block)
            self << GoogleAnalytics::Action.new(
              event_name,
              event_data,
              parent: self,
              once: once,
              **attributes,
              &block
            )
          end
        end

        module WebClientActions
          def action_data_gtag_action(action, parent_id, *)
            params = action.options.to_h.merge(
              __parent_id__: parent_id,
              event_name: action.event_name,
              event_data: action.event_data,
              signature: action.signature
            )
            # Type, URL, Options, Params (passed into javascript event/action classes)
            [action.type, nil, {}, params]
          end
        end
      end
    end
  end
end
