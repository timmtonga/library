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
	@book_count = Book.count()
	@borrowed_books = BookCheckout.count()
  end

  def stocks
	@page_title = "Baobab Health Library Management- Stock List"
	@books = Book.find(:all)
  end

  def availableItems
	@page_title = "Baobab Health Library Management- Available Items"
	@books = Book.find (:all)
	@available = []
	@books.each { |book| @available << book if book.book_checkout.nil? }
  end

  def borrowedItems
	@page_title = "Baobab Health Library Management- Borrowed Items"
	@checkedOut = BookCheckout.find(:all)
  end

  def overdue
	@page_title = "Baobab Health Library Management- Overdue Items"
	@items = BookCheckout.get_overdues()
  end

end
