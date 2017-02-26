module Hattruby::Achievements
  VERSIONS = (1.0..1.1).step(0.1).to_a.freeze
  FILENAME = 'achievements'.freeze

  def achievements(version: VERSIONS.last, user_id: nil)
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
    }
    request_params[:userID] = user_id if user_id

    perform_request(request_params)
  end
end
