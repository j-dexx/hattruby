module Hattruby::PlayerTraining

  FILENAME = 'trainingevents'.freeze
  VERSIONS = (1.1..1.3).step(0.1).to_a.freeze

  def player_training(version: VERSIONS.last, player_id:)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
      playerID: player_id,
    }

    perform_request(request_params)
  end
end
