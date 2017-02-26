require_relative '../test_helper'

class ClubTest < Minitest::Test
  def test_club
    body = 'Club'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.club.body
  end

  def test_club_with_team_id
    body = 'Club with team id'
    team_id = 242857
    stub_get.with(query: { file: filename, version: current_version, teamId: team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.club(team_id: team_id).body
  end

  def test_club_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.club({ version: 1.0 })
    end
  end

  def current_version
    Hattruby::Club::VERSIONS.last
  end

  def filename
    Hattruby::Club::FILENAME
  end
end
