class StoresController < ApplicationController

    before_action :find_store, only: [:show, :update, :edit]
    
    def new
        @store = current_user.stores.build
    end

    def create
        @store = current_user.stores.build(store_params)
        if @store.save
            flash[:success] = "New store was successfully saved"
            redirect_to @store
        else
            flash[:danger] = "There was an error in adding new store"
            render 'stores/new'
        end
    end

    def show
    end

    def edit
    
    end


    def update
        if current_user.admin? && @store.update(store_params)
            redirect_to @store
            flash[:success] = "Store was successfully updated"
        else
            redirect_to dashboard_path
            flash[:danger] = "Sorry but only the administrator can edit store details"
        end
    end

    private
        def store_params
           params.require(:store).permit(:storename, :storecode, :contactname, :phonenumber, :longitude, :latitude) 
        end

        def find_store
            @store = Store.find(params[:id])
        end

    
end
