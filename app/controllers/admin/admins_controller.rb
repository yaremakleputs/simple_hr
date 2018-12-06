class Admin
  class AdminsController < ApplicationController
    before_action :set_admin, only: [:edit, :show, :update]

    def show; end

    def edit; end

    def update
      if @admin.update(employee_param)
        flash[:success] = 'Employee updated'
        redirect_to admins_path(@admin)
      else
        flash[:error] = @admin.errors.full_messages
        render 'edit'
      end
    end

    private

    def set_admin
      @admin ||= current_admin
    end

    def admin_param
      params.require(:admin).permit(:first_name, :last_name,
                                       :email, :password)
    end
  end
end
