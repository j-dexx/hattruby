require 'simple_oauth'
require 'net/http'
require 'uri'

module Hattruby
  class Request
    BASE_URL = 'http://chpp.hattrick.org'.freeze
    PATH = '/chppxml.ashx'.freeze

    # @param client [Hattruby::Client]
    # @param params
    # @return [Hattruby::Request]
    def initialize(client, params = {})
      @client = client
      @request_method = :get
      @uri = URI.parse(BASE_URL + PATH)
      @params = params
    end

    def perform
      http = Net::HTTP.new(uri.host, uri.port)
      response = http.request(request)
      response
    end

    private

    attr_reader :request_method, :uri, :params, :client

    def encode_path_params
      encoded_params = URI.encode_www_form(params)
      [PATH, encoded_params].join("?")
    end

    def request
      req = case request_method
            when :get
              full_path = encode_path_params
              Net::HTTP::Get.new(full_path, request_headers)
            end
      req.initialize_http_header(request_headers)
      req
    end

    def oauth_header
      SimpleOAuth::Header.new(request_method, uri, params, client.credentials)
    end

    def request_headers
      {
        'Authorization' => oauth_header.to_s
      }
    end

  end
end
