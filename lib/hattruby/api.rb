require 'hattruby/achievements'
require 'hattruby/club'
require 'hattruby/economy'
require 'hattruby/fans'
require 'hattruby/hall_of_fame'
require 'hattruby/team_details'

module Hattruby
  module API
    include Hattruby::Achievements
    include Hattruby::Club
    include Hattruby::Economy
    include Hattruby::Fans
    include Hattruby::HallOfFame
    include Hattruby::TeamDetails

    private

    def perform_request(params = {})
      Hattruby::Request.new(self, params).perform
    end
  end
end
