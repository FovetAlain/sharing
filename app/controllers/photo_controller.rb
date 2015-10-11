class PhotoController < ApplicationController

  def show
    if not logged_in?
      redirect_to root_path
    end

  	@records = Dir.glob("public/images/*_small.jpg").sort
  	@page = params[:id]
  	if @page.to_i < 1
  		redirect_to photo_path(1)
  	end
  	if @page.to_i > @records.size/17
  		redirect_to photo_path(@records.size/17 )
  	end
  end

end
