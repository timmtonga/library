class MainController < ApplicationController
  def welcome
	@page_title = "Baobab Health Library Management"
  end
  
  def book
	@page_title = "Baobab Health Library Management- Books"
	@book_count = Book.count()
	@borrowed_books = BookCheckout.count()
  end

  def employees
	@page_title = "Baobab Health Library Management- Employees"
	@emp_count = Employee.count()
	@dept_count = Employee.count("distinct dept")
	@borrowers = BookCheckout.count ("distinct employee_id")
  end

  def stats
	@page_title = "Baobab Health Library Management- Stock Statistics"
  end

  def stocks
	@page_title = "Baobab Health Library Management- Stock List"
	@books = Book.find(:all)
  end

end
