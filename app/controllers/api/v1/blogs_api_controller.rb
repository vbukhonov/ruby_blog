module Api
  module V1
    class BlogsApiController < ActionController::API
      def index
        blogs = Blog.order('created_at DESC')
        render json: { status: 'SUCCESS',
                       message: 'Loaded blogs',
                       data: blogs },
               status: :ok
      end

      def show
        @blog = @current_user.blogs.find(params[:id])
        render json: { status: 'SUCCESS',
                       message: 'Loaded blog',
                       user: @current_user,
                       user_id: :user_id,
                       session: session[:user_id],
                       data: @blog },
               status: :ok
      end

      def create
        @blog = @current_user.blogs.create(blog_params)
        if @blog.save
          render json: @blog, status: :created, location: @blog
        else
          render json: @blog.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @blog = @current_user.blogs.find(params[:id])
        @blog.destroy
        render json: { status: 'SUCCESS',
                       message: 'Deleted blog',
                       data: @blog },
               status: :ok
      end

      def update
        @blog = @current_user.blogs.find(params[:id])
        if @blog.update(blog_params)
          render json: { status: 'SUCCESS',
                         message: 'Updated blog',
                         data: @blog },
                 status: :ok
        else
          render json: { status: 'ERROR',
                         message: 'Blog not updated',
                         data: @blog.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def blog_params
        params.permit(:title, :text)
      end

    end
  end
end
