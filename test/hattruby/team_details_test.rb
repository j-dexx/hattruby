require 'test_helper'

class TeamDetailsTest < Minitest::Test
  def test_team_details
    body = 'Team details'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details.body
  end

  def test_team_details_with_team_id
    body = 'Team details with team id'
    team_id = 1
    stub_get.with(query: { file: filename, version: current_version, teamID: team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details(team_id: team_id).body
  end

  def test_team_details_with_user_id
    body = 'Team details with user id'
    user_id = 1
    stub_get.with(query: { file: filename, version: current_version, userID: user_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details(user_id: user_id).body
  end

  def test_team_details_with_domestic_flags
    body = 'Team details with domestic flags'
    stub_get.with(query: { file: filename, version: current_version, includeFlags: true, includeDomesticFlags: true }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details(domestic_flags: true, flags: true).body
  end

  def test_team_details_with_domestic_flags_but_flags_not_set
    body = 'Team details with domestic flags'
    stub_get.with(query: { file: filename, version: current_version, includeFlags: true, includeDomesticFlags: true }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details(domestic_flags: true).body
  end

  def test_team_details_with_flags
    body = 'Team details with flags'
    stub_get.with(query: { file: filename, version: current_version, includeFlags: true }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details(flags: true).body
  end

  def test_team_details_with_supporters
    body = 'Team details with supporters'
    stub_get.with(query: { file: filename, version: current_version, includeSupporters: true }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_details(supporters: true).body
  end

  def test_team_details_with_incorrect_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.team_details({ version: 0.9 })
    end
  end

  def filename
    Hattruby::TeamDetails::FILENAME
  end

  def current_version
    Hattruby::TeamDetails::VERSIONS.last
  end
end
