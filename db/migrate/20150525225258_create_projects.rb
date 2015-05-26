class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :description

      t.timestamps null: false
    end
  end
end
