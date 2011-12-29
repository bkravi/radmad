class UsersController < ApplicationController
  before_filter :login_required
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all, :conditions => ["username <> ? and role_id <> ?",current_user.username,2])
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.role_id = 1  # 1 for 'user' and 2 for 'admin'
    if @user.save
      redirect_to(users_path, :notice => 'User was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(users_path, :notice => 'RJ account was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    if @user.username == SUPERADMIN
      redirect_to(users_path, :notice => "Can not delete Superadmin !!")
    else
      @user.destroy
      redirect_to(users_path, :notice => "RJ account has been deleted !!")
    end
  end

  def myday
  end

  def myprofile
  end

end
