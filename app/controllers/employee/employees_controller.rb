class Employee
  class EmployeesController < ApplicationController
    before_action :set_employee, only: [:edit, :show, :update, :destroy]
    def show; end

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

    private

    def set_employee
      @employee ||= current_employee
    end

    def employee_param
      params.require(:employee).permit(:first_name, :last_name,
                                       :email, :password)
    end
  end
end
