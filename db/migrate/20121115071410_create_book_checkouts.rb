class CreateBookCheckouts < ActiveRecord::Migration
  def self.up
    create_table :book_checkouts do |t|

      t.column :book_id,	:string
      t.column :employee_id,	:string

    end
  end

  def self.down
    drop_table :book_checkouts
  end
end
