class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def calculate_answer
    puts "Farouq Jalabi"
    redirect_to '/result'
  end
end
