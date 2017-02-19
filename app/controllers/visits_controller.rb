class VisitsController < ApplicationController

before_action :find_store

def create
	@visit = @store.visits.create(params[:visit].permit(:order, :order_value,
								 		:crm, :floorwalk, :comment, :price_survey))
	@visit.user.id = current_user.id
	@visit.save
	if @visit.save
		redirect_to dashboard_path
		flash[:success] = "Thank you, your store visit has been logged"
	else
		render 'new'
		flash[:error] = "There seems to be an issue, please try again"
	end
end

	private

	def find_store
		@store = Store.friendly.find(params[:store_id])
	end
end

t.boolean :order
      t.boolean :crm
      t.boolean :floorwalk
      t.text :comment
      t.decimal :order_value
      t.text :price_survey