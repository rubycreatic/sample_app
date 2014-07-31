module ApplicationHelper

  def full_title(page_title)
    
   base_title = "Ruby on Rails Sample App"

   if page_title.empty?   
     base_title  
   else 
     "#{base_title} | #{page_title}"      
   end 
  
  end 


  def allow_manage?(user_show)
  	current_user == user_show
  end 

end
