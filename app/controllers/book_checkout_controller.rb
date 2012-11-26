class BookCheckoutController < ApplicationController



  def circulation_borrow
	# this method displays all the available books at the time and a list of all the employees that can borrow books
	@page_title = "Baobab Health Library Manager - Borrow Book"
	@books = Book.find (:all)
	@checkedout = []
	@books.each { |book| @checkedout << book if book.book_checkout.nil? }
	@employees = Employee.find(:all)
  end
  def borrow_book 
	#this method gets details of a book that is being checked out and records the details of the checkout in the db
	employee_id = params[:employee][:id]
        books = params[:titles]
	(books || []).each do |book_id, value|
	  @book_checkdout = BookCheckout.new #(params[:book_checkout])
	  @book_checkdout.book_id = book_id
	  @book_checkdout.employee_id = employee_id
	  @book_checkdout.borrow_date = Date.today()
	  if @book_checkdout.save
	       	flash[:notice] = "Book(s) successfully checked out"
	  else
	       	flash[:notice] = "Book(s) checkout unsuccessful"
          end

	end

	redirect_to :controller => "book_checkout", :action => "circulation_borrow"

  end

  def return_book
	#this method retrieves all records of books that where checked and and the people that borrowed them
	@page_title = "Baobab Health Library Manager - Return Book"
	@borrowed_id = BookCheckout.find(:all)	
	@book_checkouts = Book.find(:all, :joins => [:book_checkout])

  end
  def returnbook
	#this methdod handles the return of a book by removing the record of the borrowing
	BookCheckout.find(params[:id]).destroy
       	flash[:notice] = "Book Returned"
	redirect_to :controller => "book_checkout", :action => "return_book"
  end

  
end
