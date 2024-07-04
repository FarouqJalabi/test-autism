class TestsController < ApplicationController

  def show
    @test = Test.first
    @questions = @test.questions.sort_by(&:order).reverse
  end
end
