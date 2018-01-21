class SpotsController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @spots = Spot.search(params[:q]).order('created_at DESC')
    @meta_description = "Fresh catch intel and original content blog offering fishing reports, tackle reviews, and locaction analysis"
    @tags = Spot.tag_counts_on(:tags).limit(5)

    
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
    @meta_description = @spot.title
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
    @spots = Spot.search(params[:q]).tagged_with(["MA Inshore"], :match_all => true).order('created_at DESC').page(params[:page]).per(15)
  end

  def east_of_chatham
    @spots = Spot.search(params[:q]).tagged_with(["east of chatham"], :match_all => true).order('created_at DESC').page(params[:page]).per(15)
  end

  def south_of_vineyard
    @spots = Spot.search(params[:q]).tagged_with(["south of vineyard"], :match_all => true).order('created_at DESC').page(params[:page]).per(15)
  end

    def gulf_of_maine
    @spots = Spot.search(params[:q]).tagged_with(["gulf of maine"], :match_all => true).order('created_at DESC').page(params[:page]).per(15)
  end

  private

    def spot_params
      params.require(:spot).permit(:title, :body, :tag_list)
    end
end

