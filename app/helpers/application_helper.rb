module ApplicationHelper
  def on_home?
    current_page?(root_path)
  end
  def on_test?
    current_page?(test_path)
  end
  def on_about?
    current_page?(static_pages_about_path)
  end
end
