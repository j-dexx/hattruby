module Hattruby::TournamentFixtures
  VERSIONS = (1.0..1.0).step(0.1).to_a.freeze
  FILENAME = 'tournamentfixtures'.freeze

  def tournament_fixtures(version: VERSIONS.last, tournament_id: )
    unless VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FILENAME,
      version: version,
      tournamentId: tournament_id,
    }

    perform_request(request_params)
  end
end
