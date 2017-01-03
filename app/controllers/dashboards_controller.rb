class DashboardsController < ApplicationController

def index
  if current_user.manager?
  		flash[:notice] = "Sorry, but you are not authorized to access this page!"
		redirect_to root_path
  elsif current_user.order_clerk?
  		flash[:notice] = "Sorry, but you are not authorized to access this page!"
		redirect_to root_path
  elsif current_user.return_clerk?
  		flash[:notice] = "Sorry, but you are not authorized to access this page!"
		redirect_to root_path
  else
  		render 'index'

  	end
  end
end
