module Hattruby::WorldDetails
  FILENAME = 'worlddetails'.freeze
  VERSIONS = (1.2..1.8).step(0.1).to_a.freeze

  def world_details(version: VERSIONS.last, regions: false, country_id: nil, league_id: nil)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }
    request_params[:includeRegions] = true if regions
    request_params[:countryID] = country_id if country_id
    request_params[:leagueID] = league_id if league_id

    perform_request(request_params)
  end
end
