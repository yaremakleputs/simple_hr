class Admin
  class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :show, :update, :destroy]
    before_action :set_employees, except: :index

    def index
      @posts = current_admin.posts
    end

    def new
      @post ||= current_admin.posts.new
      @employee_ids = Employee.all.ids
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

    def set_employees
      @employee_ids = Employee.all.ids
    end

    def post_param
      params.require(:post).permit(:title, :text,
        employee_posts_attributes: [:id, :employee_id, :_destroy])
    end
  end
end
