class ApplicationController < ActionController::Base
  around_action :switch_locale
  helper_method :get_test_bracket
  before_action :redirect_locale_param

  def redirect_locale_param
    if params[:locale] && request.query_parameters[:locale]
      redirect_to url_for(params.except(:locale).merge(locale: params[:locale])), status: :moved_permanently
    end
  end
  
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end
  
  
  def not_found!
    render "errors/not_found", status: :not_found
  end

  def get_test_bracket(x)
    # very unlikely, unlikely, likely, very unlikely
    brackets = [0.0..29.9, 30.0..49.9, 50.0..69.9, 70.0..100.0]

    index = brackets.index { |range| range.include? x }
    index.nil? ? -1 : index+1
  end
end
