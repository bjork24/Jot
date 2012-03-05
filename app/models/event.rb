class Event < ActiveRecord::Base
  belongs_to :user
end


# == Schema Information
#
# Table name: events
#
#  id      :integer(4)      not null, primary key
#  name    :string(255)
#  date    :date
#  user_id :integer(4)
#

