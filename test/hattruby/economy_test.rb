require_relative '../test_helper'

class EconomyTest < Minitest::Test
  def test_economy
    stub_get.with(query: { file: 'economy', version: 1.3 }).to_return(body: fixture('economy.xml'))
    client = get_client

    assert_equal fixture('economy.xml').read, client.economy.body
  end

  def test_economy_with_team_id
    stub_get.with(query: { file: 'economy', version: 1.3, teamId: 242857 }).to_return(body: fixture('economy_with_team_id.xml'))
    client = get_client

    assert_equal fixture('economy_with_team_id.xml').read, client.economy(team_id: 242857).body
  end

  def test_economy_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.economy({ version: 1.0 })
    end
  end
end
