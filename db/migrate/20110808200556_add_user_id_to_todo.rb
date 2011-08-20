class AddUserIdToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :user_id, :integer
    add_index :todos, :user_id
  end

  def self.down
    remove_index :todos, :user_id
    remove_column :todos, :user_id
  end
end

