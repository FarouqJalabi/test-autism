module ApplicationHelper
  def on_home?
    current_page?(root_path)
  end
  def on_test?
    current_page?(new_score_path)
  end
  def on_about?
    current_page?(pages_about_path)
  end
end
