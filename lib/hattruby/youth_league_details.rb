module Hattruby::YouthLeagueDetails
  FILENAME = 'youthleaguedetails'.freeze
  VERSIONS = (1.0..1.0).step(0.1).to_a.freeze

  def youth_league_details(version: VERSIONS.last, youth_league_id: nil)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }
    request_params[:youthleagueid] = youth_league_id if youth_league_id

    perform_request(request_params)
  end
end
