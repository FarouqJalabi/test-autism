class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @answers = Array.new(@questions.length)
  end

  def calculate_answer
    answers = params[:answers]

    # No answers received
    unless answers.present?
      redirect_to result_path
    end

    score_by_category = {}
    answers.each do |question_id, selected_option|
      question = Question.find_by(id: question_id)
      question_category = "category_"+question.category
      unless score_by_category.key?(question_category)
        score_by_category[question_category] = 0
      end

      if question.negative_key
        reverse_option = {"5"=> "1", "4"=> "2", "3"=>"3", "2"=>"4", "1"=>"5" }
        selected_option = reverse_option[selected_option]
      end

      score_by_category[question_category] += selected_option.to_i
    end

    # Result page expects category_{name} and a score
    redirect_to result_path(**score_by_category)
  end
end
