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
  
  def coordinates
    if params[:latitude] && params[:longitude].present?
    @stores = @current_user.stores.near(params[:latitude], params[:longitude], params[:distance] || 0.5, order: :distance)  
  end
    else
      render dashboard_path
      flash[:danger] = "Sorry, but your are not close enough to any of your stores"
    end
end
