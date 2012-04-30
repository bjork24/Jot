class AddPainAndFoodToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :pain, :integer, :default => nil, :limit => 1
    add_column :entries, :food, :string
  end

  def self.down
    remove_column :entries, :food
    remove_column :entries, :pain
  end
end
