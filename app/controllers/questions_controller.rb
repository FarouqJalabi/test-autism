class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def calculate_answer
    answers = params[:answers]

    # No answers received
    unless answers.present?
      redirect_to result_path
    end

    # Sum up key by category
    score_by_category = {}
    question_per_category = {}
    answers.each do |question_id, selected_option|
      question = Question.find_by(id: question_id)
      question_category = "category_"+question.category

      unless score_by_category.key?(question_category)
        score_by_category[question_category] = 0
        question_per_category[question_category] = 0
      end

      # Reverse key if needed
      if question.negative_key
        reverse_option = {"5"=> "1", "4"=> "2", "3"=>"3", "2"=>"4", "1"=>"5" }
        selected_option = reverse_option[selected_option]
      end

      # Count question score
      score_by_category[question_category] += selected_option.to_i

      # Count question
      question_per_category[question_category] += 1
    end

    score_by_category_percentage = score_to_percentage(score_by_category, question_per_category)

    # Result page expects category_{name} and a score
    redirect_to result_path(**score_by_category_percentage)
  end

  private
  #Converts scores to percentages
  def score_to_percentage(score_by_category, question_per_category)
    score_by_category_percentage = {}

    question_per_category.keys.each do   |category|
      min_score = question_per_category[category].to_f
      max_score = min_score * 5.0
      total_score = score_by_category[category].to_f

      percentage = ((total_score - min_score) / (max_score - min_score)) * 100.0
      score_by_category_percentage[category] = percentage
    end

    score_by_category_percentage
  end
end
