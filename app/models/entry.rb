class Entry < ActiveRecord::Base
  
  validates :title, :presence => true
	validates :body, :presence => true, :length => { :maximum => 500 }
  
  private
  
  def self.for_event(event)
    Entry.find(:all, :order => 'created_at DESC', :conditions => ["MONTH(created_at) = ? AND DAY(created_at) = ?", event.date.month, event.date.day])
  end
  
  def self.is_written?(params)
    entry_date = params.is_a?(Time) || params.is_a?(Date) ? params : Date::strptime("#{params[:year]}-#{params[:month]}-#{params[:day]}", "%y-%m-%d").to_datetime
    entry = Entry.find(:all, :conditions => ["created_at BETWEEN ? AND ?", entry_date.beginning_of_day, entry_date.end_of_day])
    return entry.size > 0 ? entry : false
  end
  
  def self.get_entries(params)
    if params["year"]
      entry_date = Date::strptime("#{params[:day]}-#{params[:month]}-#{params[:year]}", "%d-%m-%y").to_datetime
      Entry.find(:all, :conditions => ["YEAR(created_at) = ? AND MONTH(created_at) = ? AND DAY(created_at) = ?", entry_date.year, entry_date.month, entry_date.day])
    else
      entry_date = Date::strptime("#{params[:day]}-#{params[:month]}-2012", "%d-%m-%y").to_datetime
      Entry.find(:all, :order => 'created_at DESC', :conditions => ["MONTH(created_at) = ? AND DAY(created_at) = ?", entry_date.month, entry_date.day])
    end
  end
  
end



# == Schema Information
#
# Table name: entries
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  body       :text
#  note       :text
#  created_at :datetime
#  updated_at :datetime
#  pain       :integer(2)
#  food       :string(255)
#

