class BookCheckout < ActiveRecord::Base
	belongs_to :book
	belongs_to :employee
	validates_presence_of :book_id, :employee_id
	validates_uniqueness_of :book_id
end
