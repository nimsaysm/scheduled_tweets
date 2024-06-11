class Tweet < ApplicationRecord
  require "x"

  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 1.hours.from_now
  end

  def published?
    tweet_id?
  end

  def initialize(twitter_account)
    @twitter_account = twitter_account
  end

  def publish_to_twitter!(text:)
    tweet_body = { text: text }

    tweet = @twitter_account.client.post("tweets", tweet_body.to_json)
    tweet["data"]["id"]
  end
end
