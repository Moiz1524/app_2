class AddonsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @addons = Addon.all
    end
    def new
        @addon = current_admin.addons.build
    end
    def create
        @addon = current_admin.addons.build(addons_params)
        if @addon.save
            redirect_to addons_path, :notice => "Addon is being saved!"
        else
            render "new", :notice => "Not saved!"
        end
    end
    def edit
        @addon = Addon.find(params[:id])
    end
    def update
        @addon = Addon.find(params[:id])
        if @addon.update(addons_params)
            redirect_to addons_path, :notice => "Your Addon is being updated!"
        else
            render "edit"
        end
    end
    def show
        @addon = Addon.find(params[:id])
    end
    def destroy
        @addon = Addon.find(params[:id])
        if @addon.destroy
            redirect_to addons_path, :notice => "Addon is being deleted!"
        end
    end
    def addons_params
        params.require(:addon).permit(:id, :name, :price, :item_id)
    end
end
