require_relative '../test_helper'

class AchievementsTest < Minitest::Test
  def test_achievements
    body = 'Achievements'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.achievements.body
  end

  def test_achievements_with_user_id
    body = 'Achievements with user id'
    user_id = 1
    stub_get.with(query: { file: filename, version: current_version, userID: user_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.achievements({ user_id: user_id }).body
  end

  def test_achievements_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.achievements({ version: 0.9 })
    end
  end

  def filename
    Hattruby::Achievements::FILENAME
  end

  def current_version
    Hattruby::Achievements::VERSIONS.last
  end
end
