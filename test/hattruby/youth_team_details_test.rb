require 'test_helper'

class YouthTeamDetailsTest < Minitest::Test
  def test_youth_team_details
    body = 'Youth team details'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_team_details.body
  end

  def test_youth_team_details_with_youth_team_id
    body = 'Youth team details with team id'
    youth_team_id = 1
    stub_get.with(query: { file: filename, version: current_version, youthTeamId: youth_team_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_team_details(youth_team_id: youth_team_id).body
  end

  def test_youth_team_details_show_scouts
    body = 'Youth team details with scouts'
    stub_get.with(query: { file: filename, showScouts: true, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.youth_team_details(scouts: true).body
  end

  def test_youth_team_details_with_incorrect_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.youth_team_details({ version: 0.9 })
    end
  end

  def filename
    Hattruby::YouthTeamDetails::FILENAME
  end

  def current_version
    Hattruby::YouthTeamDetails::VERSIONS.last
  end
end
