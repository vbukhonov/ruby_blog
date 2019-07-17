class BlogsController < ApplicationController

  before_action :authorize, only: %i[new edit create update destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = @current_user.blogs.new
  end

  def edit
    @blog = @current_user.blogs.find(params[:id])
  end

  def create
    @blog = @current_user.blogs.create(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def update
    @blog = @current_user.blogs.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = @current_user.blogs.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end

end
