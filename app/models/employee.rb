class Employee < ActiveRecord::Base

	has_many :book_checkouts
	has_many :books, :through => :book_checkouts
	validates_presence_of :fname, :lname, :dept

	def fullname
	"#{fname} #{lname} (#{dept})"
	end
end


