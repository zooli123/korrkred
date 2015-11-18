class SessionsController < ApplicationController

  def new
    if logged_in?
      respond_to do |format|
        format.html {redirect_to home_path}
      end
    end
  end
  # create session, login, if user and password matches, error message, if not
  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.password == params[:session][:password]
      respond_to do |format|
        log_in user
        flash[:success] = t(:label_successful_login)
        format.html { redirect_to home_path}
      end
    return
    elsif user && user.password != params[:session][:password]
      respond_to do |format|
        flash[:error] = t(:error_login_or_password_incorrect)
        format.html { redirect_to login_path }
      end
    return
    else
      respond_to do |format|
        flash[:error] = t(:error_login_or_password_incorrect)
        format.html { redirect_to login_path }
      end
    end
    return
  end

  # neccessary for logout
  def destroy
    log_out
    redirect_to root_url
  end
end
