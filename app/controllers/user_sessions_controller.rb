class UserSessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to photo_path(1)
		end
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(photo_path(1))
    else
      flash.notice = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end

end
