class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def index
        
    end
    
    def user_home
        @menus = Menu.all
    end

    def show
        
    end
end
