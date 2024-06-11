class TwitterAccount < ApplicationRecord
    belongs_to :user
    validates :username, uniqueness: true
    
    require "x"
    attr_reader :client

    def initialize(consumer_key:, consumer_secret:, access_token:, access_token_secret:)
        @client = X::Client.new(
            consumer_key: Rails.application.credentials.dig(:twitter, :client_id),
            consumer_secret: Rails.application.credentials.dig(:twitter, :client_secret),
            access_token: Rails.application.credentials.dig(:twitter, :access_token),
            access_token_secret: Rails.application.credentials.dig(:twitter, :access_token_secret),
        )
    end
end