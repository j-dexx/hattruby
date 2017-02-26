require 'hattruby/achievements'
require 'hattruby/club'
require 'hattruby/economy'
require 'hattruby/fans'

module Hattruby
  module API
    include Hattruby::Achievements
    include Hattruby::Club
    include Hattruby::Economy
    include Hattruby::Fans

    def team_details
      perform_request({ file: 'teamdetails', version: 3.2 })
    end

    private

    def perform_request(params = {})
      Hattruby::Request.new(self, params).perform
    end
  end
end
