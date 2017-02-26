$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dotenv'
Dotenv.load
require 'hattruby'

require 'minitest/autorun'
require 'minitest/pride'

require 'webmock/minitest'
# disable external requests
WebMock.disable_net_connect!(allow_localhost: true)

def stub_get
  stub_request(:get, Hattruby::Request::BASE_URL + Hattruby::Request::PATH)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def get_client
  Hattruby::Client.new(
    consumer_key: ENV['HATTRICK_KEY'],
    consumer_secret: ENV['HATTRICK_SECRET'],
    token: ENV['TOKEN'],
    token_secret: ENV['TOKEN_SECRET']
  )
end
