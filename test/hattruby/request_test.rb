require 'test_helper'

class RequestTest < Minitest::Test
  def test_get
    body = 'Blah'
    params = { file: 'teamdetails', version: 3.2 }
    stub_get.with(query: params).to_return(body: body)
    client = get_client
    request = Hattruby::Request.new(client, params)

    response = request.perform

    assert_equal body, response.body
  end

  def get_client
    Hattruby::Client.new(
      consumer_key: ENV['HATTRICK_KEY'],
      consumer_secret: ENV['HATTRICK_SECRET'],
      token: ENV['TOKEN'],
      token_secret: ENV['TOKEN_SECRET']
    )
  end
end
