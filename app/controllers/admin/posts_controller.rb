class Admin
  class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :show, :update, :destroy]

    def index
      @posts = current_admin.posts
    end

    def new
      @post ||= current_admin.posts.new
    end

    def show; end

    def create
      @post = current_admin.posts.new(post_param)
      if @post.save
        flash[:success] = 'Post saved'
        redirect_to posts_path
      else
        flash[:error] = @post.errors.full_messages
        render 'new'
      end
    end

    def edit; end

    def update
      if @post.update(post_param)
        flash[:success] = 'Post updated'
        redirect_to posts_path(@post)
      else
        flash[:error] = @post.errors.full_messages
        render 'edit'
      end
    end

    def destroy
      @post.destroy!
    end

    private

    def set_post
      @post ||= current_admin.posts.find(params[:id])
    end

    def post_param
      params.require(:post).permit(:title, :text)
    end
  end
end
