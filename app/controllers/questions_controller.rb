class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def calculate_answer
    puts "Farouq Jalabi"
    redirect_to result_path(name: params["name"])
  end
end
