module ApplicationHelper

  
  def auth_token
    html = "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{h(form_authenticity_token)}\"/>".html_safe
    html 

  end


end
