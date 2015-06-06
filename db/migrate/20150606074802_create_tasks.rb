class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.integer :parent_id
      t.string :description
      t.integer :created_by
      t.integer :closed_by
      t.integer :assignee
      t.datetime :created_at
      t.datetime :closed_at
      t.integer :estimate
      t.integer :task_state

      t.timestamps null: false
    end
  end
end
