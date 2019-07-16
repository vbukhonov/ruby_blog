class BlogsController < ApplicationController

  def new; end

  def create
    render plain: params[:blog].inspect
  end

end
