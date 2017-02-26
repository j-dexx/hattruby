module Hattruby::Achievements
  VERSIONS = [ 1.0, 1.1 ].freeze

  def achievements(args = {})
    version = args.fetch(:version, 1.1)
    user_id = args[:user_id]

    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: 'achievements',
      version: version,
    }
    request_params[:userID] = user_id if user_id

    perform_request(request_params)
  end
end
