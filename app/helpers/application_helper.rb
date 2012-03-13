module ApplicationHelper
  
  def days_till_event(date)
    ( date - Date.today ).to_i
  end
  
end
