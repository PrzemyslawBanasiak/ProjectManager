class RemoveCreatedByFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :created_by, :tasks
  end
end
