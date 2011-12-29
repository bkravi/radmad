class UserSessionsController < ApplicationController
  before_filter :login_required, :only => :logout
  def new
    @user_session = UserSession.new
    render :layout => "login_layout"
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Welcome  #{current_user.username.humanize}"
      redirect_to users_path
    else
      flash[:notice] = "#ERROR#Invalid RJ ID or Password...  Kindly Try Again..."
      render :action => 'new', :layout => "login_layout"
    end
  end

  def logout
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Thanks for your visit. Have a peaceful time ahead !"
    redirect_to root_url
  end    

end
