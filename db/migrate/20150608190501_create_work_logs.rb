class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.references :task, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :value
      t.text :comment
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
