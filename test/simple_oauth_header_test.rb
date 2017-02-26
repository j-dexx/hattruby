require 'test_helper'
require 'uri'
require 'simple_oauth'

class SimpleOauthHeaderTest < Minitest::Test
  def test_header
    client = Hattruby::Client.new(consumer_key: 'CK', 
      consumer_secret: 'CS', token: 'AT', token_secret: 'AS')
    uri = URI::parse(Hattruby::Request::BASE_URL + '/path')
    headers = SimpleOAuth::Header.new(:get, uri, {}, client.credentials)

    assert_equal 'HMAC-SHA1', headers.options[:signature_method]
    assert_equal '1.0', headers.options[:version]
    assert_equal 'CK', headers.options[:consumer_key]
    assert_equal 'CS', headers.options[:consumer_secret]
    assert_equal 'AT', headers.options[:token]
    assert_equal 'AS', headers.options[:token_secret]
  end
end
