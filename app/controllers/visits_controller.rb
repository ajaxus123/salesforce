class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update]
  before_action :set_store

	def create
		@visit = Visit.new(visit_params)
	    @visit.user_id = current_user.id
	    @rvisit.store_id = @store.id

    if 	@visit.save
      	redirect_to @store
    else
      	redirect_to new_store_visit_path(visit: params[:visit])
    	end
	end

	def edit
	end

	def update
		@visit.update(visit_params)
	end


	private

		def set_visit
			@visit = Visit.find(params[:id])
		end

		def set_store
			@store = Store.find(params[:store_id])
		end

		def visit_params
			params.require(:review).permit(:return, :order_value, :store_issue, :feedback)
		end

end
