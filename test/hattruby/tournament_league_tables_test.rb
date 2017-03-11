require 'test_helper'

class TournamentLeagueTablesTest < Minitest::Test
  def test_tournament_league_tables
    body = 'Tournament tables'
    tournament_id = 1
    stub_get.with(query: { file: filename, version: current_version, tournamentId: tournament_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.tournament_league_tables(tournament_id: tournament_id).body
  end

  def test_tournament_league_tables_without_tournament_id
    # No stubbing as should never make request
    client = get_client

    assert_raises ArgumentError do
      client.tournament_league_tables
    end
  end

  def test_tournament_league_tables_with_incorrect_version
    # No stubbing as should never make request
    client = get_client
    tournament_id = 1

    assert_raises Hattruby::Error do
      client.tournament_league_tables(version: 0.9, tournament_id: tournament_id)
    end
  end

  def filename
    Hattruby::Tournaments::LEAGUE_TABLES_FILENAME
  end

  def current_version
    Hattruby::Tournaments::LEAGUE_TABLES_VERSIONS.last
  end
end
