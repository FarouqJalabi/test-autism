class StaticPagesController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:updated_at).reverse
    @scoreRange = scoreRange()

  end

  def scoreRange
    scores = TestScore.all.pluck(:score)

    total_scores = scores.size

    increments = (1..10).map { |i| i * 10 }

    @range_data = {}

    scores.each do |score|
      range = (score / 10.0).ceil * 10
      range = 100 if range > 100
      @range_data[range] ||= { count: 0, percentage: 0 }
      @range_data[range][:count] += 1
    end

    @range_data.each do |range, data|
      data[:percentage] = (data[:count].to_f / total_scores * 100).round(2)
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
