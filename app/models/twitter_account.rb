class TwitterAccount < ApplicationRecord
    belongs_to :user
    validates :username, uniqueness: true

    def client
        Twitter::REST::Client.new do |config|
            config.consumer_key = Rails.application.credentials.dig(:twitter, :client_id)
            config.consumer_secret = Rails.application.credentials.dig(:twitter, :client_secret)
            config.access_token = token
            config.access_token_secret = secret
        end   
    end
end