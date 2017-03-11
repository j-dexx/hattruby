require_relative '../test_helper'

class TeamTransfersTest < Minitest::Test
  def test_team_transfers
    body = 'Transfer'
    team_id = 1
    stub_get.with(query: { file: filename, version: current_version, pageIndex: 1, teamID: team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_transfers(team_id: team_id).body
  end

  def test_team_transfers_with_page
    body = 'Transfers with page'
    page = 25
    stub_get.with(query: { file: filename, version: current_version, pageIndex: page }).to_return(body: body)
    client = get_client

    assert_equal body, client.team_transfers(page: page).body
  end

  def test_team_transfers_with_page_less_than_zero
    body = 'Transfers with page'
    page = -1
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.team_transfers(page: page)
    end
  end

  def test_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.team_transfers(version: 1.0)
    end
  end

  def filename
    Hattruby::TeamTransfers::FILENAME
  end

  def current_version
    Hattruby::TeamTransfers::VERSIONS.last
  end
end
