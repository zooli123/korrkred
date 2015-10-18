class UsersController < ApplicationController

  def index
    @user = User.new
    if params[:id]
      @user = User.find(params[:id])
    end
  end
  def new
  	@user = User.new
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
      flash[:success] = t(:notice_successfully_registered)
      log_in @user
      redirect_to @user
    end
  end
	def update
	end

	private
	  def user_params
	    params.require(:user).permit(:login, :firstname, :lastname, :password)
	  end
end



















