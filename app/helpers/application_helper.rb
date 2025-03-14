module ApplicationHelper
  def canonical_url
    preferred_domain = "https://test-autism.com"
    "#{preferred_domain}#{request.path}"
  end
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
