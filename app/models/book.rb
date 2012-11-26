class Book < ActiveRecord::Base
	has_one :book_checkout	
	has_one :employee, :through => :book_checkout
	validates_presence_of :title, :author, :category, :classmark 
	validates_uniqueness_of :classmark

 

end
