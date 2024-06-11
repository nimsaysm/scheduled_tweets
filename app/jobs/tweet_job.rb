class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # Do something later
    return if tweet.publish?
    tweet.publish_to_twitter!
  end
end
