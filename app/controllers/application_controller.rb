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
end
