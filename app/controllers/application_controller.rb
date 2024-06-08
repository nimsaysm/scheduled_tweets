class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def require_user_logged_in!
        # if Current.user be Null or nil, will be redirected to sign in
        redirect_to sign_in_path, alert: "You must be signed in to do that" if Current.user.nil?
    end
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end
end
