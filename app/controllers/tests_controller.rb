class TestsController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("TEST_EDITOR_USERNAME"), password: ENV.fetch("TEST_EDITOR_PASSWORD") unless Rails.env.development?
  before_action :set_test, only: %i[ show edit update destroy ]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def build_associate
    @test = Test.find_by(id: params[:id]) || Test.new
    @test.assign_attributes(test_params)

    # FLASH HERE PLEASE
    return unless Test.nested_attributes_options.keys.include?(params[:associate]&.to_sym)
    @test.send(params[:associate]).build

    render @test.new_record? ? :new : :edit
  end
  
  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: "Test was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: "Test was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy!
    redirect_to tests_url, notice: "Test was successfully destroyed.", status: :see_other
  end

  private
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:name, :description, :visible, questions_attributes: {}, categories_attributes: {}, choices_attributes: {}, score_explanations_attributes: {}) # TODO plesas allow only 
    end
end
