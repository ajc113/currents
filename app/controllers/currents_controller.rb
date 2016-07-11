class CurrentsController < ApplicationController
before_action :authenticate_user!


def Index	
@buzzs = Buzz.order("created_at desc").limit(4).offset(1)
end


def about
end

def show
end

end



