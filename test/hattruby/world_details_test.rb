require_relative '../test_helper'

class WorldDetailsTest < Minitest::Test
  def test_world_details
    body = 'World details'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.world_details.body
  end

  def test_world_details_with_regions
    body = 'World details with regions'
    stub_get.with(query: { file: filename, version: current_version, includeRegions: true }).to_return(body: body)
    client = get_client

    assert_equal body, client.world_details(regions: true).body
  end

  def test_achievements_with_country_id
    body = 'World details with country id'
    country_id = 1
    stub_get.with(query: { file: filename, version: current_version, countryID: country_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.world_details({ country_id: country_id }).body
  end

  def test_achievements_with_league_id
    body = 'World details with league id'
    league_id = 1
    stub_get.with(query: { file: filename, version: current_version, leagueID: league_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.world_details({ league_id: league_id }).body
  end

  def test_achievements_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.world_details({ version: 1.0 })
    end
  end

  def filename
    Hattruby::WorldDetails::FILENAME
  end

  def current_version
    Hattruby::WorldDetails::VERSIONS.last
  end
end
