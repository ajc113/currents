class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.search(params[:q]).order('created_at DESC')
    @meta_description = "Fresh catch intel and original content blog offering fishing reports, tackle reviews, and locaction analysis"
    # if params[:tag]
    #   @posts = Post.tagged_with(params[:tag])
    # else
    #   @posts = Post.all
    # end
    @tags = Post.tag_counts_on(:tags).limit(5)
    # @post= Post.where(id: params[:id]) if params[:id].present?
    @tag_counts = Post.tag_counts_on(:tags).limit(10)
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end


  def show
    @post = Post.friendly.find(params[:id])
    @meta_description = @post.title
  end


  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def tag
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag])
    @tags = Post.tag_counts_on(:tags).limit(5)
    @posts = Post.tagged_with(@tag.name)
    render template: "posts/index"
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :image, :image_cache, :remove_image, :youtube_id, :tag_list)
  end



end
