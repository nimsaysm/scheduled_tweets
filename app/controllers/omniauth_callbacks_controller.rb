class OmniauthCallbacksController < ApplicationController  
    def twitter2  
        twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        twitter_account.update(
            name: auth.info.name,
            username: auth.info.nickname,
            image: auth.info.image,
            token: auth.credentials.token,
            secret: auth.credentials.secret,
        )
        redirect_to root_path, notice: "Successfully connect to your Twitter account"
    end

    def auth
        request.env['omniauth.auth']
    end
end