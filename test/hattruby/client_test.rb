require 'test_helper'

class Hattruby::ClientTest < Minitest::Test
  def test_credentials
    tokens = {
      consumer_key: 'CK',
      consumer_secret: 'CS',
      token: 'AT',
      token_secret: 'AS'
    }
    client = Hattruby::Client.new(tokens)

    assert_equal tokens, client.credentials
  end
end
