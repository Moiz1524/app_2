class MenusController < ApplicationController
    before_action :authenticate_admin!
    def index
        @menus = Menu.all
    end
    def show
        @menu = Menu.find(params[:id])
        @items = @menu.items
    end
    def new
        @menu = current_admin.menus.build
    end
    def create
        @menu = current_admin.menus.build(menu_params)
        if @menu.save
           redirect_to menus_path, :notice => 'Your Menu is saved' 
        else
            render 'new'
        end
    end
    def edit
        @menu = Menu.find(params[:id])    
    end
    def update
        @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
        redirect_to menu_path, :notice => "Updated Succesfully"
    else
        render "edit"
    end
    end
    def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy
        redirect_to menus_path, :notice => "Deleted Successfully"
    end
    def menu_params
        params.require(:menu).permit(:id, :name, :price, :admin_id)
    end
end

