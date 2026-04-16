require "mobility/backends/active_record/key_value"

class AutoTranslateJob < ApplicationJob
  queue_as :default

  def perform
    missing_translations.each do |t_type, t_id, key, missing_locals|
      source = StringTranslation.find_by(translatable_type: t_type, translatable_id: t_id, key: key)
      
      missing_locals.each { |missing_locale| translate(source, missing_locale) }
    end
  end

  private

  StringTranslation = Mobility::Backends::ActiveRecord::KeyValue::StringTranslation

  def translate(source, locale)
    translated = DeepL.translate(source.value, source.locale, locale)
    StringTranslation.create!(translatable: source.translatable, key: source.key, locale: locale, value: translated)
  end

  def missing_translations
    StringTranslation
      .group(:translatable_type, :translatable_id, :key)
      .pluck(:translatable_type, :translatable_id, :key, Arel.sql('array_agg(DISTINCT locale)'))
      .reject {|t_type, t_id, key, locales| locales.count >= I18n.available_locales.count}
      .map {|t_type, t_id, key, locals| [t_type, t_id, key, I18n.available_locales - locals.map(&:to_sym)] }
  end
end

