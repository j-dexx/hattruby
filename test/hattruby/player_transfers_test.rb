require_relative '../test_helper'

class PlayerTransfersTest < Minitest::Test
  def test_player_transfers
    body = 'Transfer'
    player_id = 1
    stub_get.with(query: { file: filename, version: current_version, playerID: player_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.player_transfers(player_id: player_id).body
  end

  def test_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.player_transfers(version: 1.0, player_id: 1)
    end
  end

  def filename
    Hattruby::PlayerTransfers::FILENAME
  end

  def current_version
    Hattruby::PlayerTransfers::VERSIONS.last
  end
end
