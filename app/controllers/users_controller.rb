class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  # GET /users
  # GET /users.json
  def index
        if logged_in?
      if current_user.username == "admin"
        @users = User.all
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
    
  end



  # GET /users/new
  def new
    if logged_in?
      if current_user.username == "admin"
        @user = User.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

 

  # POST /users
  # POST /users.json
  def create
    if logged_in?
      if current_user.username == "admin"
        @user = User.new(user_params)

        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
    
  end



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
     if logged_in?
      if current_user.username == "admin"
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
    end
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
