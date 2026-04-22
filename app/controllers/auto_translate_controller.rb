class AutoTranslateController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("TEST_EDITOR_USERNAME"), password: ENV.fetch("TEST_EDITOR_PASSWORD") unless Rails.env.development?

  def run
    AutoTranslateJob.perform_later
    redirect_back fallback_location: root_path, notice: "Auto translate job started"
  end
end
