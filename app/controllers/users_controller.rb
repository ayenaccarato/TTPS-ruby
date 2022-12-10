class UsersController < ApplicationController

  load_and_authorize_resource
  before_action :set_user, only: %i[ show edit update destroy ]

  # attr_accessor :listado_users = false

  def index
    @user = current_user
    if @user.rol == 'personal_bancario'
      @users = User.where(rol: 'cliente')
    else 
      @users = User.all
    end
  end

  def show
      # @user = User.find(params[:id])
      # render action: "detalle"
  end

  def new
    @user = User.new
  end

  # def detalle
  #     @usuario = User.find(1)
  # end

  def create
    p @user = User.new(user_params) 
    if @user.rol == 'administrador'
      @user.sucursals_id = nil
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "El usuario se creó exitosamente." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params.compact_blank)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.rol == 'personal_bancario' || @user.rol == 'cliente'
      turnos = Turn.turns_personal(@user.id)
      Turn.eliminar(turnos)
    end
    if current_user.id != @user.id

      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :rol, :password, :password_confirmation, :sucursals_id)
    end

end
