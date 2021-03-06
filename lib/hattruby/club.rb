module Hattruby::Club
  VERSIONS = (1.1..1.5).step(0.1).to_a.freeze
  FILENAME = 'club'.freeze

  def club(version: VERSIONS.last, team_id: nil)

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
