module Hattruby::HallOfFame
  VERSIONS = (1.0..1.1).step(0.1).to_a.freeze
  FILENAME = 'hofplayers'.freeze

  def hall_of_fame(version: VERSIONS.last, team_id: nil)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version
    }
    request_params[:teamID] = team_id if team_id

    perform_request(request_params)
  end
end
