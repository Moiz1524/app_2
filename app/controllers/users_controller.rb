class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
       @menus = Menu.all 
    end
    def new
        
    end
    def show
        
    end
end
