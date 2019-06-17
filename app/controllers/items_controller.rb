class ItemsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @items = Item.all
    end
    def show
        @item = Item.find(params[:id])
        @addons = @item.addons
    end
    def new
        @item = Item.new
        @addons = Addon.all
    end
    def edit
        @item = Item.find(params[:id])
    end
    def create
        @item = Item.new(item_params)
        if @item.save
           redirect_to items_path, :notice => "Item is created" 
        else
           render "new" 
        end
    end
    def update
         @item = Item.find(params[:id])
         if @item.update(item_params)
             redirect_to items_path, :notice => "Item is been updated!"
         end
    end
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path, :notice => "Deleted Successfully!"
    end
    
    def item_params
        params.require(:item).permit(:id, :name, :menu_id, addons_attributes: [:id, :name, :price, :_destroy])
    end
end
