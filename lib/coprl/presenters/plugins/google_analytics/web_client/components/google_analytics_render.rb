# frozen_string_literal: true

module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        module WebClientComponents
          def view_dir_google_analytics(_pom)
            File.join(__dir__, '../../../../../../..', 'views', 'components')
          end

          def render_google_analytics(pom, render:, components:, index:)
            # this plugin does not render any component markup.
          end

          def render_header_google_analytics(pom, render:)
            unless Settings.config.measurement_id
              raise Error, 'Missing measurement_id in plugin configuration'
            end

            render.call(:erb, :google_analytics_header,
                        views: view_dir_google_analytics(pom),
                        locals: { measurement_id: Settings.config.measurement_id })
          end
        end
      end
    end
  end
end
