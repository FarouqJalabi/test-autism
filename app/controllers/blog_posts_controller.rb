class BlogPostsController < ApplicationController
    def show
      @blog_post = BlogPost.find(params[:id])
    end
  
    def index
      @blog_posts = BlogPost.all
    end
  end
  