class SpotsController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @spots = Spot.search(params[:q]).order('created_at DESC')
    @meta_description = "Fresh catch intel and original content blog offering fishing reports, tackle reviews, and locaction analysis"
    @tags = Spot.tag_counts_on(:tags).limit(5)
    # @spot= Spot.where(id: params[:id]) if params[:id].present?
    # @tag_counts = Spot.tag_counts_on(:tags).limit(10)
    
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


  private

    def spot_params
      params.require(:spot).permit(:title, :body, :tag_list)
    end
end

