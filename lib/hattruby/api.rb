require 'hattruby/achievements'
require 'hattruby/club'
require 'hattruby/economy'
require 'hattruby/fans'
require 'hattruby/hall_of_fame'
require 'hattruby/team_details'
require 'hattruby/world_languages'
require 'hattruby/youth_avatars'
require 'hattruby/youth_team_details'

module Hattruby
  module API
    include Hattruby::Achievements
    include Hattruby::Club
    include Hattruby::Economy
    include Hattruby::Fans
    include Hattruby::HallOfFame
    include Hattruby::TeamDetails
    include Hattruby::WorldLanguages
    include Hattruby::YouthAvatars
    include Hattruby::YouthTeamDetails

    private

    def perform_request(params = {})
      Hattruby::Request.new(self, params).perform
    end
  end
end
