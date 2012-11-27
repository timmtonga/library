class BookController < ApplicationController
  def add_book
	#this method brings up the form for adding books to the database
	@page_title = "Baobab Health Library Management- Add Book to Register"
	
  end
  def save_book
	#this method saves new books to the database
	@book = Book.new (params[:book])

	if @book.save
        	flash[:notice] = "Book details successfully added"
		redirect_to :controller => "book", :action => "add_book"
	else
        	flash[:notice] = "Book details could not be saved"
		redirect_to :controller => "book", :action => "add_book"
	end

  end
  def update_book
	#this method retrieves the list of all the books in the database and displays them for updating
	@page_title = "Baobab Health Library Management- Update Book in Register"
	@books = Book.find (:all)
  end
  
  def remove_book
	#this method retrieves all the books in the database and displays them so that the user can select which book to delete
	@page_title = "Baobab Health Library Management- Delete Book in Register"
	@books = Book.find (:all)
  end
  
  def update_book_details
	# this method retrieves details ofa book that has been selected for updating and displays them to the user to make changes
	@page_title = "Baobab Health Library Management- Update Book in Register"
	@book = Book.find (params[:id])
  end

  def save_update
	#this method is for saving changes that have been made to book details
	@books = Book.find (params[:id])

	if @books.update_attributes(params[:book])
        	flash[:notice] = "Book details successfully updated"
		redirect_to :controller => "main", :action => "welcome"
	else
        	flash[:notice] = "Book details could not be updated"
		redirect_to :controller => "book", :action => "update_book"
	end
  end

  def delete_book_rec
	# this method deletes a selected book from the database
	Book.find(params[:id]).destroy
       	flash[:notice] = "Book record successfully deleted"
	redirect_to :controller => "book", :action => "remove_book"
  end

  def list_books
	#this method is for listing all the books in the database
	@page_title = "Baobab Health Library Management- Book List"
	@books = Book.find(:all)
  end
end
