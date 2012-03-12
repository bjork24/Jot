class User < ActiveRecord::Base
  
  has_many :entries
  has_many :events
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id       :integer(4)      not null, primary key
#  provider :string(255)
#  uid      :string(255)
#  name     :string(255)
#
