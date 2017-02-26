module Hattruby::Economy
  VERSIONS = (1.1..1.3).step(0.1).to_a.freeze
  FILENAME = 'economy'.freeze

  def economy(version: VERSIONS.last, team_id: nil)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }
    request_params[:teamId] = team_id if team_id

    perform_request(request_params)
  end
end
