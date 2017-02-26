require_relative '../test_helper'

class EconomyTest < Minitest::Test
  def test_economy
    body = 'Economy'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.economy.body
  end

  def test_economy_with_team_id
    body = 'Economy with team id'
    stub_get.with(query: { file: filename, version: current_version, teamId: 242857 }).to_return(body: body)
    client = get_client

    assert_equal body, client.economy(team_id: 242857).body
  end

  def test_economy_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.economy({ version: 1.0 })
    end
  end

  def filename
    Hattruby::Economy::FILENAME
  end

  def current_version
    Hattruby::Economy::VERSIONS.last
  end
end
