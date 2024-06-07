Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter2, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)
end