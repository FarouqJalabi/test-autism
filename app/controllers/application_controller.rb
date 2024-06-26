class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end
  
  
  def not_found!
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
