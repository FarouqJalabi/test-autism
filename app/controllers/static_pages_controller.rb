class StaticPagesController < ApplicationController
  def index
    @blog_posts = BlogPost.all.sort_by(&:updated_at).reverse
  end
  
  def translations
  end

  def privacy_policy
  end

  def about
  end

  def faq
  end
end
