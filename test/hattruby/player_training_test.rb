require_relative '../test_helper'

class PlayerTrainingTest < Minitest::Test
  def test_player_training
    body = 'Training'
    player_id = 1
    stub_get.with(query: { file: filename, version: current_version, playerID: player_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.player_training(player_id: player_id).body
  end

  def test_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.player_training(version: 1.0, player_id: 1)
    end
  end

  def filename
    Hattruby::PlayerTraining::FILENAME
  end

  def current_version
    Hattruby::PlayerTraining::VERSIONS.last
  end
end
