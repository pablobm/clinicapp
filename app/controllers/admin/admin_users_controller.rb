module Admin
  class AdminUsersController < ApplicationController
        before_action :authenticate_admin_user!
        before_action :set_admin_user, only: [:show, :edit, :update]
      
        def index
          @admin_users = AdminUser.all
        end
        
        def show
            
        end
        
        def new
            @admin_user = AdminUser.new
        end
        
        def create
            @admin_user = AdminUser.new(admin_user_params)
        
            if @admin_user.save
              redirect_to admin_admin_user_path(@admin_user), notice: 'Admin user was successfully created.'
            else
              render :new
            end
        end 
        
        def edit
            
        end
        
        def update
            if @admin_user.update(admin_user_params)
              redirect_to admin_admin_user_path(@admin_user), notice: 'Admin user was successfully updated.'
            else
              render :edit
            end
        end

        private

        def set_admin_user
            @admin_user = AdminUser.find(params[:id])
        end

        def admin_user_params
            params.require(:admin_user).permit(:email, :password, :password_confirmation)
      
        end
    end
  end