class StoresController < ApplicationController
    before_action :find_store, only: [:show, :edit, :update]
    
    def new
        @store = current_user.stores.build 
    end
    
        
    def create
        @store = current_user.stores.build(store_params)
        if @store.save
            redirect_to @store
            flash[:success] = "New store was successfully saved"
        else
            render 'new'
            flash[:danger] = "There was an error in adding new store"
        end
    end

    def show
        if @store.user_id == current_user.id
            render 'show'
        else
            redirect_to dashboard_path
            flash[:danger] = "Sorry, but you can't do that!"
        end
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
           params.require(:store).permit(:storename, :storecode, :contactname, :phonenumber, :latitude, :longitude, :location, :channel_id, :channel_name) 
        end

        def find_store
            @store = Store.find(params[:id])
        end

    
end
