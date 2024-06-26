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

    total_score = 0
    # Sum up key by category
    answers.each do |question_id, selected_option|
      question = Question.find_by(id: question_id)


      # Reverse key if needed
      if question.negative_key
        reverse_option = {"0"=> "1", "1"=>"0"}
        selected_option = reverse_option[selected_option]
      end

      total_score += selected_option.to_i
    end


    # Result page expects score
    redirect_to result_path(score: total_score*10)
  end

  def result
    # Should maybe be in tests?
    unless params.present? and params["score"].present?
      not_found!
    end
  end

end
