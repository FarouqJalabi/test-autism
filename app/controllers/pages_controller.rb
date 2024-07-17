class PagesController < ApplicationController
  def index
    @blogs = Blog.recent
    
    @tests_taken = TestScore.count
    score_counts = count_scores
    @percentages = calculate_percentages(score_counts, @tests_taken)
    
    @very_unlikely_percentage = @percentages[:very_unlikely]
    @unlikely_percentage = @percentages[:unlikely]
    @likely_percentage = @percentages[:likely]
    @very_likely_percentage = @percentages[:very_likely]
  end

  def count_scores
    tests = TestScore.all
    {
      very_unlikely: tests.select{|score| get_test_bracket(score.score)==1 }.count,
      unlikely:      tests.select{|score| get_test_bracket(score.score)==2 }.count,
      likely:        tests.select{|score| get_test_bracket(score.score)==3 }.count,
      very_likely:   tests.select{|score| get_test_bracket(score.score)==4 }.count,
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
