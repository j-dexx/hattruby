module Hattruby::TeamTransfers
  FILENAME = 'transfersteam'.freeze
  VERSIONS = (1.2..1.2).step(0.1).to_a.freeze

  def team_transfers(version: VERSIONS.last, page: 1, team_id: nil)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end
    if page < 0
      raise Hattruby::Error, 'Page must be greater than or equal to 0'
    end

    request_params = {
      file: FILENAME,
      version: version,
      pageIndex: page,
    }
    request_params[:teamID] = team_id if team_id

    perform_request(request_params)
  end
end
