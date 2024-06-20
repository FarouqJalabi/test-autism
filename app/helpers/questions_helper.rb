module QuestionsHelper
  def percentage_to_label(percentage)
    if percentage >= 0.0 and percentage <= 39.0
      "very unlikely"
    elsif percentage >= 40.0 and percentage <= 59.0
      "unlikely"
    elsif percentage >= 60.0 and percentage <= 79.0
      "likely"
    end
    "very likely"
  end





end
