require_relative '../test_helper'

class YouthLeagueDetailsTest < Minitest::Test
  def test_youth_league_details
    body = 'Youth league'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_league_details.body
  end

  def test_youth_league_details_with_youth_league_id
    body = 'Youth league with id'
    youth_league_id = 1
    stub_get.with(query: { file: filename, version: current_version, youthleagueid: youth_league_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_league_details(youth_league_id: youth_league_id).body
  end

  def test_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.youth_league_details({ version: 0.9 })
    end
  end

  def filename
    Hattruby::YouthLeagueDetails::FILENAME
  end

  def current_version
    Hattruby::YouthLeagueDetails::VERSIONS.last
  end
end
