class Entry < ActiveRecord::Base
  belongs_to :user
  
  private
  
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
#  note       :string(255)
#  token      :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

