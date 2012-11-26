class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|

	      t. column :fname,  :string
	      t. column :lname,  :string
	      t. column :dept,  :string

    end
  end

  def self.down
    drop_table :employees
  end
end
