require 'hattruby/achievements'
require 'hattruby/club'
require 'hattruby/economy'
require 'hattruby/fans'
require 'hattruby/hall_of_fame'
require 'hattruby/player_training'
require 'hattruby/player_transfers'
require 'hattruby/team_details'
require 'hattruby/team_tournaments'
require 'hattruby/team_transfers'
require 'hattruby/tournaments'
require 'hattruby/translations'
require 'hattruby/world_details'
require 'hattruby/world_languages'
require 'hattruby/youth_avatars'
require 'hattruby/youth_league_details'
require 'hattruby/youth_team_details'

module Hattruby
  module API
    include Hattruby::Achievements
    include Hattruby::Club
    include Hattruby::Economy
    include Hattruby::Fans
    include Hattruby::HallOfFame
    include Hattruby::PlayerTraining
    include Hattruby::PlayerTransfers
    include Hattruby::TeamDetails
    include Hattruby::TeamTournaments
    include Hattruby::TeamTransfers
    include Hattruby::Tournaments
    include Hattruby::Translations
    include Hattruby::WorldDetails
    include Hattruby::WorldLanguages
    include Hattruby::YouthAvatars
    include Hattruby::YouthLeagueDetails
    include Hattruby::YouthTeamDetails

    private

    def perform_request(params = {})
      Hattruby::Request.new(self, params).perform
    end
  end
end
