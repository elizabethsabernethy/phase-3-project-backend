class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.string :name
      t.integer :important
      t.integer :urgent
      t.integer :complete
    end
  end
end
