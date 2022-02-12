module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'SUCCESS', date: post }
        else
          render json: { status: 'SUCCESS', date: post.errors }
        end
      end

      def destroy
        @post.destroy
        render json: { data: @post }
      end

      def update
        if @post.update(post_params)
          render json: { data: @post }
        else
          render json: { status: 'Sucess', message: 'Not updated', data: @post.errors }
        end
      end

      private

      # 組み込みの機能でこういう名前にすると@post設定可
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
