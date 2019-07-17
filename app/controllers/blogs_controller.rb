class BlogsController < ApplicationController

  def show
    @blog = Blog.find(params[:id])
  end

  def new; end

  def create
    @blog = Blog.new(blog_params)

    @blog.save
    redirect_to @blog
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end

end
