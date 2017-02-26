require_relative '../test_helper'

class HallOfFameTest < Minitest::Test
  def test_hall_of_fame
    body = 'Hall of Fame'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.hall_of_fame.body
  end

  def test_hall_of_fame_with_team_id
    body = 'Hall of Fame with Team Id'
    team_id = 12
    stub_get.with(query: { file: filename, version: current_version, teamID: team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.hall_of_fame(team_id: team_id).body
  end

  def test_hall_of_fame_with_incorrect_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.hall_of_fame({ version: 0.9 })
    end
  end

  def current_version
    Hattruby::HallOfFame::VERSIONS.last
  end

  def filename
    Hattruby::HallOfFame::FILENAME
  end
end
