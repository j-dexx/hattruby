module Hattruby::Fans
  VERSIONS = [ 1.0, 1.1, 1.2 ].freeze
  def fans(args = {})
    version = args.fetch(:version, 1.2)
    team_id = args[:team_id]

    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: 'fans',
      version: version
    }
    request_params[:teamId] = team_id if team_id

    perform_request(request_params)
  end
end
