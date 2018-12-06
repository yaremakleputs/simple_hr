class Employee
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    after_action :set_seen, only: [:show]

    def index
      @posts = current_employee.posts
    end

    def show; end

    private

    def set_post
      @post ||= current_employee.posts.find(params[:id])
    end

    def set_seen
      employee_post = current_employee.employee_posts
                                      .find_by(post: @post)
      employee_posts.update!(seen: true) if employee_post
    end
  end
end
