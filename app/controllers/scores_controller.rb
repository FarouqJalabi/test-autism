class ScoresController < ApplicationController
    invisible_captcha only: [:create]
    before_action :set_test

    def show
      @score = Score.find_by!(slug: params[:slug])
    end

    def new
      @score = Score.new
    end

    def create
      answers = params[:score]
      
      if answers.nil?
        render :new, status: :unprocessable_entity and return
      end

      total_score, score_by_category = calculate_score(@test.questions, answers)
      @score = Score.new(score: total_score, test: @test, category_scores: score_by_category)

      if @score.save
        redirect_to @score
      else
        flash[:error] = @score.errors.full_messages.join (", ") # Should never be the case
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_test
      @test = Test.find_by(id: params[:test_id]) || Test.first
    end


    def calculate_score(questions, answers)
      total_score = 0
      score_by_category = Hash.new(0)

      questions.each do |question|
        answer = answers[question.id.to_s].to_i
        total_score += answer
        score_by_category[question.category_id] += answer
      end

      [total_score, score_by_category]
    end
end
