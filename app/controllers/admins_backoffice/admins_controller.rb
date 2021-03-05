class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    password_blank?
    @admin = Admin.find(params[:id])
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path , notice: "Administrador atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def password_blank?
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end


end
