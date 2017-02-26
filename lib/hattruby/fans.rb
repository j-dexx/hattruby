module Hattruby::Fans
  VERSIONS = (1.0..1.2).step(0.1).to_a.freeze
  FILENAME = 'fans'.freeze

  def fans(version: VERSIONS.last, team_id: nil)

    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version
    }
    request_params[:teamId] = team_id if team_id

    perform_request(request_params)
  end
end
