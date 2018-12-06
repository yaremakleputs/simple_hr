class Employee
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    def index
      @posts = Post.all
    end

    def show; end

    private

    def set_post
      @post ||= Post.find(params[:id])
    end

    def set_seen
      employee_post = current_employee.employee_posts
                                      .find_by(post: @post)
      employee_posts.update!(seen: true) if employee_post
    end
  end
end
