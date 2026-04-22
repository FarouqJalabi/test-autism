require "mobility/backends/active_record/key_value"

class AutoTranslateJob < ApplicationJob
  queue_as :default

  def perform
    missing_translations.each do |t_type, t_id, key, missing_locals|
      source = StringTranslation.find_by(translatable_type: t_type, translatable_id: t_id, key: key)

      missing_locals.each { |missing_locale| translate(source, missing_locale) }
    end

    outdated_translations.each do |t_type, t_id, key|
      latest_translation = StringTranslation.where(translatable_type: t_type, translatable_id: t_id, key: key).order(:updated_at).last
      latest_translation.touch

      outdated_locals = I18n.available_locales - [latest_translation.locale.to_sym]

      outdated_locals.each { |outdated_locale| translate(latest_translation, outdated_locale) }
    end
  end

  private

  StringTranslation = Mobility::Backends::ActiveRecord::KeyValue::StringTranslation

  def translate(source, locale)
    translated = DeepL.translate(source.value, source.locale, locale)
    record = StringTranslation.find_or_initialize_by(translatable: source.translatable, key: source.key, locale: locale)
    record.update!(value: translated)
    record.touch
  end

  def outdated_translations
    StringTranslation
      .group(:translatable_type, :translatable_id, :key)
      .pluck(:translatable_type, :translatable_id, :key, Arel.sql('array_agg(updated_at)'))
      .reject {|t_type, t_id, key, updated_ats| updated_ats.empty? }
      .select {|t_type, t_id, key, updated_ats| updated_ats.max - updated_ats.min >= 10.minutes }
      .map {|t_type, t_id, key, locals| [t_type, t_id, key] }
  end

  def missing_translations
    StringTranslation
      .group(:translatable_type, :translatable_id, :key)
      .pluck(:translatable_type, :translatable_id, :key, Arel.sql('array_agg(DISTINCT locale)'))
      .reject {|t_type, t_id, key, locales| locales.count >= I18n.available_locales.count}
      .map {|t_type, t_id, key, locals| [t_type, t_id, key, I18n.available_locales - locals.map(&:to_sym)] }
  end
end

