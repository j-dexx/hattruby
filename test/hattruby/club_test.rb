require_relative '../test_helper'

class ClubTest < Minitest::Test
  def test_club
    stub_get.with(query: { file: 'club', version: 1.5 }).to_return(body: fixture('club.xml'))
    client = get_client

    assert_equal fixture('club.xml').read, client.club.body
  end

  def test_club_with_id
    stub_get.with(query: { file: 'club', version: 1.5, teamID: 242857 }).to_return(body: fixture('club_with_team_id.xml'))
    client = get_client

    assert_equal fixture('club_with_team_id.xml').read, client.club(team_id: 242857).body
  end

  def test_club_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.club({ version: 1.0 })
    end
  end
end
