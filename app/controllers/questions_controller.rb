class QuestionsController < ApplicationController

  def index
    #  @questions = Question.all
    @questions = [
        { id: 1, content: "How outgoing are you?" },
        { id: 2, content: "How organized are you?" },
        { id: 3, content: "How adventurous are you?" }
      ]
    @answers = Array.new(@questions.length)
  end

  def calculate_answer
    @answers = params[:answers]

    total_score = 0

    @answers.each do |question_index, selected_options|
      selected_options = [selected_options] unless selected_options.is_a?(Array)

      question_score = selected_options.map(&:to_i).sum

      total_score += question_score
    end

    # Result page expects category_{name} and a score
    redirect_to result_path(category_total_score: total_score, category_2: 25)
  end
end
