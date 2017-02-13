class PagesController < ApplicationController

  skip_before_action :authenticate_user!

  def index
  	if current_user.try(:admin?)
		redirect_to admin_path
	elsif current_user.try(:manager?)
		redirect_to manager_path
	elsif current_user.try(:order_clerk?)
		redirect_to orders_path
	elsif current_user.try(:return_clerk?)
		redirect_to returns_path
	elsif current_user
		redirect_to dashboard_path
	else 
	render "index"
	end
  end
end
