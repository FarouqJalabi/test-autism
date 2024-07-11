class HomesController < ApplicationController
  def index
    @blog_posts = BlogPost.all.sort_by(&:updated_at).reverse
  end
end
