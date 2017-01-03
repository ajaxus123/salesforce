class StoresController < ApplicationController

    def new
        @store = current_user.stores.build
    end

    def create
        @store = current_user.stores.build(store_params)
    end
    
    def show
        
    end

    private
        def store_params
           params.require(:store).permit(:storename, :storecode, :contactname, :contactnumber, :longitude, :latitude) 
        end

end
