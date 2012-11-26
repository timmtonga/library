class EmployeeController < ApplicationController
  def remove_employee
	#this method handles the listing of all the employees registered in the system for possible deletion
	@page_title = "Baobab Health Library Management- Delete Employee Record"
	@employees = Employee.find(:all)
  end
  
  def delete
	#this method deletes the record of a particular employee that has been selected to be deleted
	Employee.find(params[:id]).destroy
       	flash[:notice] = "Employee details deleted"
	redirect_to :controller => "employee", :action => "remove_employee"
  end
  def save_emp
	#this method handles the writing to the database of a new employee record upon addition
	@employee = Employee.new (params[:employee])

	if @employee.save
        	flash[:notice] = "Employee successfully added"
		redirect_to :controller => "main", :action => "welcome"
	else
		redirect_to :controller => "employee", :action => "add_employee"
	end
  end

  def update_employee
	#this method lists all the records of employees for possible updating
	@page_title = "Baobab Health Library Management- Update Employee Record"
	@employees = Employee.find(:all)
  end
  
  def update
	#retrieves details of an employee that has been selected for update
	@page_title = "Baobab Health Library Management- Update Employee Record"
	@emp = Employee.find(params[:id])
  end
  def update_emp
	#saves the updated details for the employee to the database
	@employee = Employee.find (params[:id])

	if @employee.update_attributes (params[:employee])
        	flash[:notice] = "Employee details successfully updated"
		redirect_to :controller => "main", :action => "welcome", :flash => "Employee detail successfully updated"
	else
        	flash[:notice] = "Employee details update failed"
		redirect_to :controller => "employee", :action => "update"
	end
  end
  def list_employee
	#lists all the employees registered in the system
	@page_title = "Baobab Health Library management- Employee List"
	@employees = Employee.find(:all)
  end
end
