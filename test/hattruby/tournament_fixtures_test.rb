require 'test_helper'

class TournamentFixturesTest < Minitest::Test
  def test_tournament_fixtures
    body = 'Tournament fixtures'
    tournament_id = 1
    stub_get.with(query: { file: filename, version: current_version, tournamentId: tournament_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.tournament_fixtures(tournament_id: tournament_id).body
  end

  def test_tournament_fixtures_without_tournament_id
    # No stubbing as should never make request
    client = get_client

    assert_raises ArgumentError do
      client.tournament_fixtures
    end
  end

  def test_tournament_fixtures_with_incorrect_version
    # No stubbing as should never make request
    client = get_client
    tournament_id = 1

    assert_raises Hattruby::Error do
      client.tournament_fixtures(version: 0.9, tournament_id: tournament_id)
    end
  end

  def filename
    Hattruby::Tournaments::FIXTURES_FILENAME
  end

  def current_version
    Hattruby::Tournaments::FIXTURES_VERSIONS.last
  end
end
