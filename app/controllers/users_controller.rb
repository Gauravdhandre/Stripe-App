class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(assign_params)  
    if @user.save  
        flash[:notice] = "Registration Successful."  
        #redirect_to medicines_path  
    else  
        render :action => 'new'  
    end
  end  

  def edit
    @user = current_user
  end

  def show
  end

  def update
      @user = current_user  
    if @user.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated profile."  
      redirect_to root_url  
    else  
      render :action => 'edit'  
    end  
  end

  def index
    if current_user.present?
    @users = User.joins(:payments).select("users.*, payments.price, payments.pay_date").where(id: current_user.id)
    end
  end

  def destroy
  end

  def assign_params
    params.require(:user).permit(:name , :email , :password , :password_confirmation )
  end
end