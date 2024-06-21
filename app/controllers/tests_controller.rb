class TestsController < ApplicationController
  def index
    @tests = Test.all

  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions.sort_by(&:order).reverse
  end
end
