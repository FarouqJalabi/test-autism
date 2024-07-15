class PagesController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:updated_at).reverse
    
    @tests_taken = TestScore.count   
    
    @very_unlikely_count = TestScore.where('score <= ?', 30).count
    @unlikely_count = TestScore.where('score > ? AND score <= ?', 30, 50).count
    @likely_count = TestScore.where('score > ? AND score <= ?', 50, 70).count
    @very_likely_count = TestScore.where('score > ?', 70).count

    if @tests_taken > 0
      @very_unlikely_percentage = (@very_unlikely_count.to_f / @tests_taken * 100).round(2)
      @unlikely_percentage = (@unlikely_count.to_f / @tests_taken * 100).round(2)
      @likely_percentage = (@likely_count.to_f / @tests_taken * 100).round(2)
      @very_likely_percentage = (@very_likely_count.to_f / @tests_taken * 100).round(2)
    else
      @very_unlikely_percentage = 0.0
      @unlikely_percentage = 0.0
      @likely_percentage = 0.0
      @very_likely_percentage = 0.0
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
