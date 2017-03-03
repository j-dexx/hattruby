module Hattruby::TeamDetails
  VERSIONS = (1.9..3.4).step(0.1).to_a.freeze
  FILENAME = 'teamdetails'.freeze

  def team_details(version: VERSIONS.last, team_id: nil, user_id: nil, supporters: false, flags: false, domestic_flags: false)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }
    request_params[:teamID] = team_id if team_id
    request_params[:userID] = user_id if user_id
    request_params[:includeSupporters] = true if supporters
    if flags || domestic_flags
      request_params[:includeFlags] = true
    end
    request_params[:includeDomesticFlags] = true if domestic_flags

    perform_request(request_params)
  end
end
