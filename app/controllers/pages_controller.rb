class PagesController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:updated_at).reverse
    @tests_taken = TestScore.count   
    @above_50_count = TestScore.where('score > ?', 60).count
    @under_50_count = TestScore.where('score < ?', 30).count
    
    if @tests_taken > 0
      @above_50_percentage = (@above_50_count.to_f / @tests_taken * 100).round(2)
      @under_50_percentage = (@under_50_count.to_f / @tests_taken * 100).round(2)
    else
      @above_50_percentage = 0.0
      @under_50_percentage = 0.0
    end
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
