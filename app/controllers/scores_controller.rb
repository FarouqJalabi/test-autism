class ScoresController < ApplicationController
    def show
        @score = Score.find(params[:id])
     end
    def new
        @test = Test.first
        @questions = @test.questions.sort_by(&:order).reverse
        @question_length = Question.count

        @test_score = Score.new
    end

    def create
        answers = params[:answers]
    
        if answers.blank?
          # redirect_to show and return
        end
    
        total_score = calculate_total_score(answers)
    
        percentage = calculate_percentage(total_score, 50)
    
        Score.new(score: percentage).save


        # redirect_to score_path(score: percentage)
    end
    
    def result
        if params[:score].blank?
          not_found!
        else
          params[:score] = params[:score].to_i.clamp(0, 100)
        end
    end
    
    private
    
    def calculate_total_score(answers)
        total_score = 0
    
        answers.each do |question_id, selected_option|
          question = Question.find_by(id: question_id)
          next unless question
    
          selected_option = reverse_option_if_needed(question, selected_option)
    
          total_score += selected_option.to_i
        end
    
        total_score
    end
    
    def reverse_option_if_needed(question, selected_option)
        if question.negative_key
          reverse_option = { "0" => "1", "1" => "0" }
          selected_option = reverse_option[selected_option]
        end
    
        selected_option
    end
    
    def calculate_percentage(score, max_score)
        (score * 100) / max_score
    end
end
