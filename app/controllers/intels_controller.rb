class IntelsController < InheritedResources::Base
  before_action :authenticate_user!


  def index
    @intels = Intel.search(params[:q]).order('created_at DESC').page(params[:page]).per(5)
    @meta_description = "Fresh catch intel and original content blog offering fishing reports, tackle reviews, and locaction analysis"
    # if params[:tag]
    #   @intels = intel.tagged_with(params[:tag])
    # else
    #   @intels = intel.all
    # end
    @tags = Intel.tag_counts_on(:tags).limit(5)
    @post= Intel.where(id: params[:id]) if params[:id].present?
    @tag_counts = Intel.tag_counts_on(:tags).limit(10)
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
    @meta_description = @intel.title
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



  private

    def intel_params
      params.require(:intel).permit(:title, :body)
    end
end

