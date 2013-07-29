module ApplicationHelper
  def active(path)
    "active" if current_page?(path)
  end
  
  def is_admin?
    true if current_user && current_user.role == "admin"
  end    
end
