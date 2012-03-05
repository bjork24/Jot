class Entry < ActiveRecord::Base
  belongs_to :user
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

