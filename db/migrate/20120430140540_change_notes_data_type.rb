class ChangeNotesDataType < ActiveRecord::Migration
  def self.up
    change_table :entries do |t|
      t.change :note, :text
    end
  end

  def self.down
    change_table :entries do |t|
      t.change :note, :string
    end
  end
end
