class ScoresController < ApplicationController
    invisible_captcha only: [:create]
    before_action :set_test

    def show
      # TODO remove old way to find score when adequate time has passed
      redirect_to Score.find_by(id: params[:slug]), status: 301 and return if Score.find_by(id: params[:slug])

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
