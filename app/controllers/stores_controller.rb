class StoresController < ApplicationController

    before_action :find_store, only: [:show, :edit, :update]

    def new
        @store = current_user.stores.build
    end

    def create
        @store = current_user.stores.build(store_params)
        if @store.save
            respond_to do |format|
            format.html { redirect_to @store, notice: 'New store was successfully saved.' }
            format.json { render :show, status: :created, location: @store }
        end
        else
            format.html { render :new, notice: "There appears to be an error, please contact administator" }
            format.json { render json: @store.errors, status: :unprocessable_entity }
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
