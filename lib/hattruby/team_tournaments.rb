module Hattruby::TeamTournaments
  VERSIONS = (1.0..1.0).step(0.1).to_a.freeze
  FILENAME = 'tournamentlist'.freeze

  def team_tournaments(version: VERSIONS.last, team_id: nil)
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
