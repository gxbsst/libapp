module ApplicationHelper
  def top_menu
    if current_user
     "Welcome, #{current_user.email}"
    else
      content_tag(:div, id: "top-menu") do
        link_to "Register", register_path
      end
    end
  end
end
