class AddCurrencyColumnToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :currency, :string, :default => ""
  end
end
