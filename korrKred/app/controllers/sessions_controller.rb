class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if user
      if user.password == params[:session][:password]
        respond_to do |format|
          flash[:success] = t(:label_successful_login)
          log_in user
          format.html { redirect_to "/home/" + user.id.to_s }
        end
      end
      return
    else
      respond_to do |format|
        flash[:error] = t(:error_login_or_password_incorrect)
        format.html { redirect_to '/login' }
      end
      return
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
