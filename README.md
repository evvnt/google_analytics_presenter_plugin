# Google Analytics Presenter Plugin

A [COPRL](http://github.com/coprl/coprl) presenter plugin that includes Google Analytics scripts on the page.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_analytics_presenter_plugin', git: 'https://github.com/evvnt/google_analytics_presenter_plugin'
```

And then execute:

    $ bundle

You'll also need to configure a `measurement_id`:

```ruby
Coprl::Presenters::Plugins::GoogleAnalytics::Settings.configure do |c|
  c.measurement_id = 'G-something'
end
```

## Usage in POMs

### Globally

To include Google Analytics on all pages, add the `:google_analytics` plugin to COPRL's global
collection of plugins:

```ruby
Coprl::Presenters::Settings.configure do |c|
  c.presenters.plugins << :google_analytics
end
```

### On specific pages

If you don't want Google Analytics active everywhere, include it in individual POMs as necessary:
```ruby
plugin :google_analytics
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/evvnt/google_analytics_presenter_plugin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the COPRL project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/coprl/coprl/blob/master/CODE-OF-CONDUCT.md).
