module QuestionsHelper
  def percentage_to_label(percentage)
    if percentage >= 0.0 and percentage <= 40.0
      "Low"
    elsif percentage >= 40.0 and percentage <= 60.0
      "Average"
    else
    "High"
    end

  end
end
