require 'test_helper'

class YouthAvatarsTest < Minitest::Test
  def test_youth_avatars
    body = 'Youth avatars'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_avatars.body
  end

  def test_youth_avatars_with_youth_team_id
    body = 'Youth avatars'
    youth_team_id = 1
    stub_get.with(query: { file: filename, version: current_version, youthTeamId: youth_team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_avatars(youth_team_id: 1).body
  end

  def test_youth_avatar_with_incorrect_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.youth_avatars({ version: 0.9 })
    end
  end

  def filename
    Hattruby::YouthAvatars::FILENAME
  end

  def current_version
    Hattruby::YouthAvatars::VERSIONS.last
  end
end
