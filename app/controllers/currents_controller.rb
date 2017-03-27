class CurrentsController < ApplicationController
# before_action :authenticate_user!


def index
@buzzs = Buzz.all.order("created_at DESC").limit(5)
end


def about
end

def rules
end

def test
@species = Species.all
end

def show
end

end

private

