module Hattruby::Translations
  FILENAME = 'translations'.freeze
  VERSIONS = (1.0..1.1).step(0.1).to_a.freeze

  def translations(version: VERSIONS.last, language_id:)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
      languageid: language_id,
    }

    perform_request(request_params)
  end
end
