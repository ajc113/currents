class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.search(params[:q]).order('created_at DESC').page params[:page]
    set_meta_tags title: "Blog",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "Big game fishing articles covering big game fishing tactics, catch reports, tackle reviews, and locations",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"
    @tags = Post.tag_counts_on(:tags).limit(5)
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
    set_meta_tags title: @post.meta_title,
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: @post.meta_description,
                  keywords: @post.meta_keywords
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
    params.require(:post).permit(:title, :body, :image, :image_cache, :remove_image, :youtube_id, :tag_list, :meta_title, :meta_description, :meta_keywords)
  end



end
