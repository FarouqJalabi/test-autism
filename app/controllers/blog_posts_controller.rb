class BlogPostsController < ApplicationController
    def show
      @blog_post = BlogPost.find(params[:id])
    end
  
    def index
      @blog_posts = BlogPost.all.sort_by(&:updated_at).reverse
    end
  end
  