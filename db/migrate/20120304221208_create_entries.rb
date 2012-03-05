class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.string :note
      #t.integer :token
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
