module Coprl
  module Presenters
    module Plugins
      module GoogleAnalytics
        module WebClientComponents
          def view_dir_google_analytics(_pom)
            File.join(__dir__, '../../../../..', 'views', 'components')
          end

          def render_google_analytics(pom, render:, components:, index:)
            # this plugin does not render any component markup.
          end

          def render_header_google_analytics(pom, render:)
            ga_measurement_ids = pom.context[:ga_measurement_ids] || []

            render.call(:erb, :google_analytics_header,
                        views: view_dir_google_analytics(pom),
                        locals: { measurement_ids: ga_measurement_ids, debug_mode: ENV['debug_mode'] == 'true' })
          end

          def render_gtag_event(comp, render:, components:, index:)
            render.call :erb, :gtag_event, views: view_dir_google_analytics(comp),
                        locals: {comp: comp, components: components, index: index}
          end

        end
      end
    end
  end
end
