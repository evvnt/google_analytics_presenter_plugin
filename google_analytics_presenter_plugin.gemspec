# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_analytics_presenter_plugin/version'

Gem::Specification.new do |spec|
  spec.name          = 'google_analytics_presenter_plugin'
  spec.version       = GoogleAnalyticsPresenterPlugin::VERSION
  spec.authors       = ['Nick Miller']
  spec.email         = ['nick@evvnt.com']

  spec.summary       = 'A COPRL presenter plugin for Google Analytics'
  spec.homepage      = 'http://github.com/evvnt/google_analytics_presenters_plugin'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'rake', '~> 13'
end
