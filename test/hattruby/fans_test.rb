require_relative '../test_helper'

class FansTest < Minitest::Test
  def test_fans
    stub_get.with(query: { file: 'fans', version: 1.2 }).to_return(body: fixture('fans.xml'))
    client = get_client

    assert_equal fixture('fans.xml').read, client.fans.body
  end

  def test_fans_with_team_id
    stub_get.with(query: { file: 'fans', version: 1.2, teamId: 185530 }).to_return(body: fixture('fans_with_team_id.xml'))
    client = get_client

    assert_equal fixture('fans_with_team_id.xml').read, client.fans({ team_id: 185530 }).body
  end

  def test_fans_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.fans({ version: 0.9 })
    end
  end
end
