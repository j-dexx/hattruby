require_relative '../test_helper'

class FansTest < Minitest::Test
  def test_fans
    body = 'Fans'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.fans.body
  end

  def test_fans_with_team_id
    body = 'Fans with team id'
    stub_get.with(query: { file: filename, version: current_version, teamId: 185530 }).to_return(body: body)
    client = get_client

    assert_equal body, client.fans({ team_id: 185530 }).body
  end

  def test_fans_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.fans({ version: 0.9 })
    end
  end

  def filename
    Hattruby::Fans::FILENAME
  end

  def current_version
    Hattruby::Fans::VERSIONS.last
  end
end
