class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.boolean :next_action
      t.string :status
      t.integer :project_id

      t.timestamps
    end
    add_index :todos, :project_id
  end

  def self.down
    drop_table :todos
  end
end

