class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
  	if resource.manager?
  		manager_path
  	elsif resource.admin?
  		admin_path
  	elsif resource.order_clerk?
  			orders_path
  	elsif resource.return_clerk?
  			returns_path
  	else dashboard_path
  	end	
  end

end
