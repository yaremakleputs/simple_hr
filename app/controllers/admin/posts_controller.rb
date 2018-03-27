class Admin
  class PostsController < ApplicationController
    def index
      @posts = current_admin.posts
    end
  end
end
