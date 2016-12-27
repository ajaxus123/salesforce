class ReturnsController < ApplicationController

def index
	if current_user.return_clerk?
		render 'index'
	else
		flash[:notice] = "Sorry, but you are not authorized to access this page!"
		redirect_to root_path
	end	
end


end
