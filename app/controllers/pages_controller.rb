class PagesController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:updated_at).reverse
    
    @tests_taken = TestScore.count
    score_counts = count_scores
    @percentages = calculate_percentages(score_counts, @tests_taken)
    
    @very_unlikely_percentage = @percentages[:very_unlikely]
    @unlikely_percentage = @percentages[:unlikely]
    @likely_percentage = @percentages[:likely]
    @very_likely_percentage = @percentages[:very_likely]
  end

  def count_scores
    {
      very_unlikely: TestScore.where('score <= ?', 30).count,
      unlikely: TestScore.where('score > ? AND score <= ?', 30, 50).count,
      likely: TestScore.where('score > ? AND score <= ?', 50, 70).count,
      very_likely: TestScore.where('score > ?', 70).count
    }
  end
  
  def calculate_percentages(counts, total)
    counts.transform_values { |count| total > 0 ? (count.to_f / total * 100).round(2) : 0.0 }
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
