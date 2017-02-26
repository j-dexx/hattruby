module Hattruby::Economy
  VERSIONS = [ 1.1, 1.2, 1.3 ].freeze

  def economy(args = {})
    version = args.fetch(:version, 1.3)
    team_id = args[:team_id]

    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: 'economy',
      version: version,
    }
    request_params[:teamId] = team_id if team_id

    perform_request(request_params)
  end
end
