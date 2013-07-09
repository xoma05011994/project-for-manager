class AddStatusColumnToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :status, :string, :default => ""
  end
end
