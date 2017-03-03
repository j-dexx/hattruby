module Hattruby::YouthTeamDetails
  VERSIONS = (1.0..1.1).step(0.1).to_a.freeze
  FILENAME = 'youthteamdetails'.freeze

  def youth_team_details(version: VERSIONS.last, youth_team_id: nil, show_scouts: false)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }
    request_params[:youthTeamId] = youth_team_id if youth_team_id
    request_params[:showScouts] = true if show_scouts

    perform_request(request_params)
  end
end
