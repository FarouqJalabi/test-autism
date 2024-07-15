class PagesController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:updated_at).reverse
    @tests_taken = TestScore.count   
    @very_likely = TestScore.where('score > ?', 60).count
    @likely = TestScore.where('score < ?', 30).count
    
    if @tests_taken > 0
      @very_likely_percentage = (@very_likely.to_f / @tests_taken * 100).round(2)
      @likely_percentage = (@likely.to_f / @tests_taken * 100).round(2)
    else
      @very_likely_percentage = 0.0
      @likely_percentage = 0.0
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
