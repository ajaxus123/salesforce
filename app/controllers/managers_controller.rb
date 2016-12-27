class ManagersController < ApplicationController

def index
	if current_user.manager?
		render 'index'
	else
		flash[:notice] = "Sorry, but you are not authorized to access this page!"
		redirect_to root_path
	end	
end


end
