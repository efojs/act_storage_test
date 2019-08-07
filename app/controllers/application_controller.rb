class ApplicationController < ActionController::Base
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:id, :image)
  end
end
