class ScoresController < ApplicationController
    invisible_captcha only: [:create]
    before_action :set_test

    def show
      # TODO remove old way to find score when adequate time has passed
      # if score_by_id = Score.find_by(id: params[:slug])
      #   redirect_to score_by_id, status: 301 
      #   return 
      # end

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

      # TODO calculate sub categories
      total_score = answers.values.map(&:to_i).sum
      @score = Score.new(score: total_score, test: @test)

      if @score.save
        redirect_to @score
      else
        flash[:error] = @score.errors.full_messages.join (", ") # Should never be the case
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_test
      @test = Test.first
    end

end
