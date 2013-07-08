class CreateProgrammerProjects < ActiveRecord::Migration
  def change
    create_table :programmer_projects do |t|
      t.integer :programmer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
