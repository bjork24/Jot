class RemoveUserReferencesFromTables < ActiveRecord::Migration
  def self.up
    remove_column :entries, :user_id
    remove_column :events, :user_id
  end

  def self.down
  end
end
