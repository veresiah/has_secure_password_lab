class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    auth_user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless auth_user
    session[:user_id] = auth_user.id
    @user = auth_user
    redirect_to controller: 'welcome', action: 'home'
  end 

  def destroy 
    session.delete :user_id
    redirect to "root"
  end 
end
