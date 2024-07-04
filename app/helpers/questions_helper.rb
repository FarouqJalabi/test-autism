module QuestionsHelper
  def question_length(question)
    question.test.questions.count
  end
  def percentage_to_header(percentage)
    if percentage >= 0.0 and percentage <= 20.0
      t("result.fullLabel1")
    elsif percentage >= 30.0 and percentage <= 40.0
      t("result.fullLabel2")

    elsif percentage >= 50.0 and percentage <= 60.0
      t("result.fullLabel3")
    else
      t("result.fullLabel4")
    end
  end
  def percentage_to_label(percentage)
    if percentage >= 0.0 and percentage <= 20.0
      t("result.label1")
    elsif percentage >= 30.0 and percentage <= 40.0
      t("result.label2")

    elsif percentage >= 50.0 and percentage <= 60.0
      t("result.label3")
    else
      t("result.label4")
    end
  end

  # For now we have descriptions hard coded
  # If we get several tests they will be coded into the test themselves
  def percentage_to_description(percentage)
    if percentage >= 0.0 and percentage <= 20.0
      t("result.description1")
    elsif percentage >= 30.0 and percentage <= 40.0
      t("result.description2")
    elsif percentage >= 50.0 and percentage <= 60.0
      t("result.description3")
    else
      t("result.description4")
    end
  end

  def percentage_to_share(percentage)
    if percentage >= 0.0 and percentage <= 20.0
      t("result.share1")
    elsif percentage >= 30.0 and percentage <= 40.0
      t("result.share2")
    elsif percentage >= 50.0 and percentage <= 60.0
      t("result.share3")
    else
      t("result.share4")
    end
  end


end
