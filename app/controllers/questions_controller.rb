class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def calculate_answer
    puts "Farouq Jalabi"
    redirect_to result_path(catagoery_1: params["name"], catagoery_2: "Test")
  end
end
