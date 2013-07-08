class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :manager_id
      t.integer :status_id
      t.date :date_of_start
      t.date :deadline
      t.float :totally
      t.float :paid
      t.float :to_pay
      t.text :comment
      t.integer :currency_id
      t.integer :client_id

      t.timestamps
    end
  end
end
