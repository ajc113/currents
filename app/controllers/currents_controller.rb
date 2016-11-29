class CurrentsController < ApplicationController
# before_action :authenticate_user!


def index
@buzzs = Buzz.all.order("created_at DESC").limit(5)
@buzz = "Yolo"

# @locations = Location.all
# @users = User.all
# @menus = Menu.all.order("created_at DESC").limit(5)
end


def about
end

def show
end

end

private

