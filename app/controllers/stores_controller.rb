class StoresController < ApplicationController

    before_action :find_store, only: [:show, :update]

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
        if current_user.admin?
            @store = Store.find(params[:id])
        else
            flash[:danger] = "Sorry but you are not authorized to do this, please contact administrator"
            render 'show'
        end
    end


    def update

    end

    private
        def store_params
           params.require(:store).permit(:storename, :storecode, :contactname, :phonenumber, :longitude, :latitude) 
        end

        def find_store
            @store = Store.find(params[:id])
        end

end
