module ScoresHelper
  def question_length(question)
    question.test.questions.count
  end

  def percentage_to_header(percentage)
    percentage_to_translation(percentage, "result.fullLabel")
  end

  def percentage_to_label(percentage)
    percentage_to_translation(percentage, "result.label")
  end

  def percentage_to_description(percentage)
    percentage_to_translation(percentage, "result.description")
  end

  def percentage_to_share(percentage)
    percentage_to_translation(percentage, "result.share")
  end

  private

  def percentage_to_translation(percentage, base_key)
    case percentage
        when 0.0..29.9
        # very unlikly
        t("#{base_key}1")
        when 30.0..49.9
        # unlikly
        t("#{base_key}2")
        when 50.0..69.9
        # likly
        t("#{base_key}3")
        else
        # very likly
        t("#{base_key}4")
    end
  end
end
