module Hattruby::TeamDetails
  VERSIONS = (1.9..3.4).step(0.1).to_a.freeze
  FILENAME = 'teamdetails'.freeze

  def team_details(version: VERSIONS.last, team_id: nil)
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
