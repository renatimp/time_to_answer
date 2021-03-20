class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_user

  def edit
  end

  def update
    sign_in(@user, bypass: true)
    if @user.update(params_user)
      redirect_to users_backoffice_welcome_index_path, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
