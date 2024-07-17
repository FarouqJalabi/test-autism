class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end
  
  
  def not_found!
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def get_test_bracket(x)
    # very unlikely, unlikely, likely, very unlikely
    brackets = [0.0..29.9, 30.0..49.9, 50.0..69.9, 70.0..100.0].freeze

    index = brackets.index { |range| range.include? x }
    index.nil? ? index : -1
  end
end
