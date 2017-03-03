module Hattruby::WorldLanguages
  FILENAME = 'worldlanguages'.freeze
  VERSIONS = (1.2..1.2).step(0.1).to_a.freeze

  def world_languages(version: VERSIONS.last)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }

    perform_request(request_params)
  end
end
