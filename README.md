# Ruby example with Healenium

Ruby 4 + RSpec + `selenium-webdriver`.

To run test Helenium Selenium docker setup  is required. See [Healeinum](https://github.com/healenium/healenium)

## Prerequisites (macOS)

This project needs **Ruby 4.x** and a matching **Bundler**. System Ruby will fail with missing Bundler or incompatible gems.

With Homebrew:

```sh
brew install ruby
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc   # Apple Silicon
# or: export PATH="/usr/local/opt/ruby/bin:$PATH"   # Intel
source ~/.zshrc
ruby -v   
gem install bundler
cd healenium-example-ruby
bundle install
```

## Configure the client for Healenium

Remote WebDriver and proxy URL are set in **`lib/healenium/selenium/driver_factory.rb`**: `Healenium::Selenium::DriverFactory` calls `Selenium::WebDriver.for(:remote, url: …)` using `Healenium::Selenium::PROXY_URL` (default `http://localhost:8085`, overridable with env **`HEALENIUM_PROXY_URL`**).

## Run tests

```sh
bundle install
bundle exec rspec
```

Run a single file:

```sh
bundle exec rspec spec/simple_spec.rb
```

## Disable healing for a section

```ruby
@driver.execute_script('disable_healing_true')
# ...
@driver.execute_script('disable_healing_false')
```

## Community / Support

* [Telegram chat](https://t.me/healenium)
* [Healenium on GitHub](https://github.com/healenium)
