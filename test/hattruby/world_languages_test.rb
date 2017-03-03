require 'test_helper'

class WorldLanguagesTest < Minitest::Test
  def test_world_languages
    body = 'World languages'
    stub_get.with(query: { file: filename, version: current_version }).to_return(body: body)
    client = get_client

    assert_equal body, client.world_languages.body
  end

  def test_world_languages_with_incorrect_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.world_languages({ version: 1.1 })
    end
  end

  def filename
    Hattruby::WorldLanguages::FILENAME
  end

  def current_version
    Hattruby::WorldLanguages::VERSIONS.last
  end
end
