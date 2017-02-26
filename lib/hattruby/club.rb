module Hattruby::Club
  VERSIONS = [ 1.1, 1.2, 1.3, 1.4, 1.5 ].freeze

  def club(args = {})
    version = args.fetch(:version, 1.5)
    team_id = args[:team_id]

    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: 'club',
      version: version
    }
    request_params[:teamID] = team_id if team_id

    perform_request(request_params)
  end
end
