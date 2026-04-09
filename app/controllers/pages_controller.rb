class PagesController < ApplicationController
  def index
    @blogs = Blog.recent
    
    @tests_taken = Score.count
    @percentages = calculate_percentages(count_scores, @tests_taken)
    
    @unlikely_percentage = @percentages[:unlikely]
    @likely_percentage = @percentages[:likely]
  end
  
  def translations
  end

  def privacy_policy
  end

  def about
  end

  def faq
  end

  def terms
  end

  private
  def count_scores
    tests = Score.all
    {
      unlikely: Score.where(score: 0..24).count,
      likely: Score.where(score: 25..50).count,
    }
  end

  def calculate_percentages(counts, total)
    counts.transform_values { |count| total > 0 ? (count.to_f / total * 100).round(2) : 0.0 }
  end

end
