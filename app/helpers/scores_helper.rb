module ScoresHelper
  def question_length(question)
    question.test.questions.count
  end

  def percentage_to_header(percentage)
    t("result.fullLabel"+(get_test_bracket(percentage)+1).to_s)
  end

  def percentage_to_label(percentage)
    t("result.label"+(get_test_bracket(percentage)+1).to_s)
  end

  def percentage_to_description(percentage)
    t("result.description"+(get_test_bracket(percentage)+1).to_s)
  end

  def percentage_to_share(percentage)
    t("result.share"+(get_test_bracket(percentage)+1).to_s)
  end

end
