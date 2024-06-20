class HomesController < ApplicationController
  def index
    @first_test = Test.first
  end
end
