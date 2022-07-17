class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done, default: false
      t.integer :sort, default: 0
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.time :time, default: "12:00"
      t.references :project, index: true
      t.references :user, index: true
      t.timestamps
    end
    add_index :tasks, [:project_id, :name], unique: true
    add_index :tasks, [:project_id, :sort], unique: true
  end
end
