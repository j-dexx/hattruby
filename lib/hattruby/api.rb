require 'hattruby/achievements'
require 'hattruby/club'
require 'hattruby/economy'

module Hattruby
  module API
    include Hattruby::Achievements
    include Hattruby::Club
    include Hattruby::Economy

    def team_details
      perform_request({ file: 'teamdetails', version: 3.2 })
    end

    private

    def perform_request(params = {})
      Hattruby::Request.new(self, params).perform
    end
  end
end
