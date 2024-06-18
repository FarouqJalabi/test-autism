class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def calculate_answer
    puts "Farouq Jalabi"
    redirect_to result_path(category_1: params["name"], category_2: "Test")
  end
end
