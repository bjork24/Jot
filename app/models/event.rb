class Event < ActiveRecord::Base
  
  validates :name, :presence => true
  
  private
  
  def self.for_entry(entry)
    Event.find(:all, :conditions => ["MONTH(date) = ? AND DAY(date) = ?", entry.created_at.month, entry.created_at.day])
  end
  
  def self.in_order
    today = Date.today
    checkDate = Date.new(2012,today.month,today.day)
    events = {
      :future => Event.find(:all, :order => 'date ASC', :conditions => ["date >= ?", checkDate]),
      :past => Event.find(:all, :order => 'date ASC', :conditions => ["date < ?", checkDate])
    }
  end
  
end



# == Schema Information
#
# Table name: events
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#  date :date
#

