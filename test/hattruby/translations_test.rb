require_relative '../test_helper'

class TranslationsTest < Minitest::Test
  def test_translations
    body = 'Translations'
    language_id = 1
    stub_get.with(query: { file: filename, version: current_version, languageid: language_id }).to_return(body: body)
    client = get_client

    assert_equal body, client.translations(language_id: language_id).body
  end

  def test_with_wrong_version
    # No stubbing as should never make request
    client = get_client

    assert_raises Hattruby::Error do
      client.translations(version: 0.9, language_id: 1)
    end
  end

  def filename
    Hattruby::Translations::FILENAME
  end

  def current_version
    Hattruby::Translations::VERSIONS.last
  end
end
