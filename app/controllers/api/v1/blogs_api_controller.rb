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
    end
  end
end
