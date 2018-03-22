class SpotsController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @spots = Spot.search(params[:q]).order('created_at DESC').page(params[:page])
      set_meta_tags title: "Fishing Spots",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "New england offshore fishing spots and boat launch locations", 
                  keywords: "New england fishing intel, boat ramps, catch reports, big game fishing, offshore fishing"
   end


  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)

    if @spot.save
      redirect_to @spot
    else
      render 'new'
    end
  end


  def show
    @spot = Spot.friendly.find(params[:id])
    set_meta_tags title: @spot.title,
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: @spot.body,
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"


  end


  def edit
    @spot = Spot.friendly.find(params[:id])
  end

  def update
    @spot = Spot.friendly.find(params[:id])

    if @spot.update(spot_params)
      redirect_to @spot
    else
      render 'edit'
    end
  end

  def destroy
    @spot = Spot.friendly.find(params[:id])
    @spot.destroy

    redirect_to spots_path
  end

  def tag
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag])
    @tags = Spot.tag_counts_on(:tags).limit(15)
    @spots = Spot.tagged_with(@tag.name)
    render template: "spots/index"
  end

  def ma_inshore
    @spots = Spot.search(params[:q]).tagged_with(["MA Inshore"], :match_all => true).order('created_at DESC').page(params[:page]).per(10)
    set_meta_tags title: "MA Fishing Spots",
                      site: "Currents Fishing Network",
                      reverse: true,
                      keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"  

  end

  def east_of_chatham
    @spots = Spot.search(params[:q]).tagged_with(["east of chatham"], :match_all => true).order('created_at DESC').page(params[:page]).per(10)
    set_meta_tags title: "East of Chatham Fishing Spots",
                      site: "Currents Fishing Network",
                      reverse: true,
                      keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"  
  


  end

  def south_of_vineyard
    @spots = Spot.search(params[:q]).tagged_with(["south of vineyard"], :match_all => true).order('created_at DESC').page(params[:page]).per(10)
    set_meta_tags title: "South of Vineyard Fishing Spots",
                      site: "Currents Fishing Network",
                      reverse: true,
                      keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"  
  


  end

    def gulf_of_maine
    @spots = Spot.search(params[:q]).tagged_with(["gulf of maine"], :match_all => true).order('created_at DESC').page(params[:page]).per(10)
    set_meta_tags title: "Gulf of Maine Fishing Spots",
                      site: "Currents Fishing Network",
                      reverse: true,
                      keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"  
  

  end

  def boat_ramps
    @spots = Spot.search(params[:q]).order('title ASC').tagged_with(["boat launch locations"], :match_all => true).order('created_at DESC').page(params[:page]).per(10)
    set_meta_tags title: "New England Boat Ramps",
                    site: "Currents Fishing Network",
                    reverse: true,
                    keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"  


  end

  private

    def spot_params
      params.require(:spot).permit(:title, :body, :image, :tag_list)
    end
end

