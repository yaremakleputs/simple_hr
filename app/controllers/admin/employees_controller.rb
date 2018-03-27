class Admin
  class EmployeesController < ApplicationController
    before_action :set_employee, only: [:edit, :show, :update, :destroy]

    def index
      @employees = Employee.all
    end

    def new
      @employee ||= Employee.new
    end

    def show; end

    def create
      @employee = Employee.new(employee_param)
      if @employee.save
        flash[:success] = 'Employee saved'
        redirect_to employees_path
      else
        flash[:error] = @employee.errors.full_messages
        render 'new'
      end
    end

    def edit; end

    def update
      if @employee.update(employee_param)
        flash[:success] = 'Employee updated'
        redirect_to employee_path(@employee)
      else
        flash[:error] = @employee.errors.full_messages
        render 'edit'
      end
    end

    def destroy
      @employee.destroy!
    end

    private

    def set_employee
      @employee ||= Employee.find(params[:id])
    end

    def employee_param
      params.require(:employee).permit(:first_name, :last_name,
                                       :email, :password)
    end
  end
end
