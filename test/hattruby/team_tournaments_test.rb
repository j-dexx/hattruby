require_relative '../test_helper'

class TeamTournamentsTest < Minitest::Test
  def test_team_tournaments
    body = 'Team tournaments'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_tournaments.body
  end

  def test_team_tournaments_with_team_id
    body = 'Team tournaments with team id'
    team_id = 1
    stub_get.with(query: { file: filename, version: current_version, teamId: team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_tournaments(team_id: team_id).body
  end

  def test_team_tournaments_with_incorrect_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.team_tournaments({ version: 0.9 })
    end
  end

  def filename
    Hattruby::TeamTournaments::FILENAME
  end

  def current_version
    Hattruby::TeamTournaments::VERSIONS.last
  end
end
