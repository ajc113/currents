class IntelsController < InheritedResources::Base
  # before_action :authenticate_user!


  def index
    @intels = Intel.search(params[:q]).order('created_at DESC').page params[:page]
    set_meta_tags title: "Daily Intel",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "New england fishing reports from private network of commercial and recreational offshore fisherman", 
                  keywords: "New england fishing reports, boat ramps, catch reports, big game fishing, offshore fishing"

  end


  def new
    @intel = Intel.new
  end

  def create
    @intel = Intel.new(intel_params)

    if @intel.save
      redirect_to @intel
    else
      render 'new'
    end
  end


  def show
    @intel = Intel.friendly.find(params[:id])
    set_meta_tags title: "Daily fishing reports for New England",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "Daily fishing reports for New England",
                  keywords: "New england fishing reports, fishing reports, catch reports, big game fishing, offshore fishing"


  end


  def edit
    @intel = Intel.friendly.find(params[:id])
  end

  def update
    @intel = Intel.friendly.find(params[:id])

    if @intel.update(intel_params)
      redirect_to @intel
    else
      render 'edit'
    end
  end

  def destroy
    @intel = Intel.friendly.find(params[:id])
    @intel.destroy

    redirect_to intels_path
  end

  def tag
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag])
    @tags = intel.tag_counts_on(:tags).limit(5)
    @intels = intel.tagged_with(@tag.name)
    render template: "intels/index"
  end

  def spotter
    @intels = Intel.tagged_with(["spotter"], :match_all => true).order('created_at DESC').page(params[:page]).per(5)
    set_meta_tags title: "Spotter Plane Intel",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "Spotter plane weekly intel report",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing, spotter plane"
                  
  end

  private

    def intel_params
      params.require(:intel).permit(:title, :body, :tag_list)
    end
end

