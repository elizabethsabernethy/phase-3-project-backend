class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :important
      t.integer :urgent
      t.integer :complete
      t.integer :task_list_id
    end
  end
end
