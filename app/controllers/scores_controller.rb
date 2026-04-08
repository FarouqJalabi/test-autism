class ScoresController < ApplicationController
    invisible_captcha only: [:create]

    def show
      # TODO remove old way to find score when adequate time has passed
      redirect_to Score.find_by(id: params[:slug]), status: 301 and return if Score.find_by(id: params[:slug])

      @score = Score.find_by!(slug: params[:slug])
    end

    def new
        @test = Test.first

        @score = Score.new
    end

    def create
        answers = params[:score]

        if answers.nil?
          render :new, status: :unprocessable_entity and return
        end
    
        total_score = answers.values.map(&:to_i).sum
        percentage = total_score*2 

        @score = Score.new(score: percentage) # In future we will store score not persantage !

        if @score.save
          redirect_to @score
        else
          render :new, status: :unprocessable_entity
        end

    end

end
