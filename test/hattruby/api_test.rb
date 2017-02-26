require 'test_helper'

class ApiTest < Minitest::Test
  def test_teams
    stub_get.with(query: { file: 'teamdetails', version: 3.2 }).to_return(body: fixture('teamdetails.xml'))
    client = get_client

    assert_equal fixture('teamdetails.xml').read, client.team_details.body
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
