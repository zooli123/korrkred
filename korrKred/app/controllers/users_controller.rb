class UsersController < ApplicationController

  def index
    @user = User.new
    if params[:id]
      @user = User.find(params[:id])
    end
  end

  def new
  	@user = User.new
    if logged_in?
      respond_to do |format|
        format.html {redirect_to home_path}
      end
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    users = User.select("login")
    for user in users
      if user.login == @user.login
        respond_to do |format|
          flash[:notice] = t(:notice_login_occupied)
          format.html { redirect_to '/signup' }
        end
        return
      end
    end
    if @user.save
      log_in @user
      redirect_to home_path
    else
      flash[:error] = t(:error_all_fields_must_be_filled)
      redirect_to signup_path
    end
  end

	def update
	end

	private
	  def user_params
	    params.require(:user).permit(:login, :firstname, :lastname, :password)
	  end
end



















