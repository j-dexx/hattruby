module Hattruby::Tournaments
  DETAILS_FILENAME = 'tournamentleaguetables'.freeze
  DETAILS_VERSIONS = (1.0..1.0).step(0.1).to_a.freeze

  FIXTURES_FILENAME = 'tournamentfixtures'.freeze
  FIXTURES_VERSIONS = (1.0..1.0).step(0.1).to_a.freeze

  LEAGUE_TABLES_FILENAME = 'tournamentleaguetables'.freeze
  LEAGUE_TABLES_VERSIONS = (1.0..1.0).step(0.1).to_a.freeze

  def tournament_details(version: DETAILS_VERSIONS.last, tournament_id:)
    unless DETAILS_VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: DETAILS_FILENAME,
      version: version,
      tournamentId: tournament_id,
    }

    perform_request(request_params)
  end

  def tournament_fixtures(version: FIXTURES_VERSIONS.last, tournament_id: )
    unless FIXTURES_VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: FIXTURES_FILENAME,
      version: version,
      tournamentId: tournament_id,
    }

    perform_request(request_params)
  end

  def tournament_league_tables(version: LEAGUE_TABLES_VERSIONS.last, tournament_id:)
    unless LEAGUE_TABLES_VERSIONS.include?(version)
      raise Hattruby::Error, 'Incorrect version specified'
    end

    request_params = {
      file: LEAGUE_TABLES_FILENAME,
      version: version,
      tournamentId: tournament_id,
    }

    perform_request(request_params)
  end

end
