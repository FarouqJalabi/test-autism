class PagesController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:updated_at).reverse
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
