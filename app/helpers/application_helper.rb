module ApplicationHelper
  def active?(link_path)
    if current_page?(link_path)
      'active'
    else
      ''
    end
  end
end
