require_relative '../test_helper'

class AchievementsTest < Minitest::Test
  def test_achievements
    stub_get.with(query: { file: 'achievements', version: 1.1 }).to_return(body: fixture('achievements.xml'))
    client = get_client

    assert_equal fixture('achievements.xml').read, client.achievements.body
  end

  def test_achievements_with_user_id
    stub_get.with(query: { file: 'achievements', version: 1.1, userID: 185530 }).to_return(body: fixture('achievements_with_user_id.xml'))
    client = get_client

    assert_equal fixture('achievements_with_user_id.xml').read, client.achievements({ user_id: 185530 }).body
  end

  def test_achievements_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.achievements({ version: 0.9 })
    end
  end
end
