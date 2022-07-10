class PostsController < ApplicationController
  def index
    @posts = mature_posts
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      PostMailer.with(post: @post).new_post_email.deliver_later

      flash[:notice] = "Dzięki za komentarz"
      redirect_to posts_path
    end
  end

  def edit
    post
  end

  def show
    post
  end

  def update
    if post.update(post_params)
      redirect_to posts_path, notice: "Poscik został zaktualizowany."
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, notice: "Poscik został usunięty."
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :mature_content)
  end

  def mature_posts
    return Post.where(mature_content: nil).or(Post.where(mature_content: false)) if current_user == nil
    if current_user.age <= 18
      Post.where(mature_content: nil).or(Post.where(mature_content: false))
    else
      Post.all
    end
  end
end
