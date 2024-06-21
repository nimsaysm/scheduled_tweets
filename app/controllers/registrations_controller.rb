class RegistrationsController < ApplicationController
  #action new instantiates a new user, but does not save it in the database
  #this user will be used in the view when the form is build
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # if it was saved on DataBase
        #user cookie
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Sucessfully created account"
    else 
      render :new
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)    
  end
end
