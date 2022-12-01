class SucursalsController < ApplicationController

  load_and_authorize_resource
  before_action :set_sucursal, only: %i[ show edit update destroy ]

  # GET /sucursals or /sucursals.json
  def index
    @sucursals = Sucursal.all
  end

  # GET /sucursals/1 or /sucursals/1.json
  def show
  end

  # GET /sucursals/new
  def new
    @sucursal = Sucursal.new
  end

  # GET /sucursals/1/edit
  def edit
  end

  # POST /sucursals or /sucursals.json
  def create
    @sucursal = Sucursal.new(sucursal_params)
    @sucursal.nombre  = @sucursal.nombre.upcase #Para que se guarde en mayuscula y sepa si existe ese nombre, por como puedan escribirlos

    respond_to do |format|
      if @sucursal.save
        format.html { redirect_to sucursal_url(@sucursal), notice: "Sucursal was successfully created." }
        format.json { render :show, status: :created, location: @sucursal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursals/1 or /sucursals/1.json
  def update
    respond_to do |format|
      if @sucursal.update(sucursal_params)
        format.html { redirect_to sucursal_url(@sucursal), notice: "Sucursal was successfully updated." }
        format.json { render :show, status: :ok, location: @sucursal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursals/1 or /sucursals/1.json
  def destroy
    @sucursal.destroy

    respond_to do |format|
      format.html { redirect_to sucursals_url, notice: "Sucursal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def nuevo_horario
    @sucursal = Sucursal.find(params[:id])
    @horario = Horario.new
  end

  def crear_horario
    @sucursal = Sucursal.find(params[:id])
    @horario = Horario.new(horario_params)
    @horario.sucursal_id = @sucursal.id
    if @horario.save
      redirect_to @sucursal, notices: "Se agregó el horario correctamente"
    else
      flash[:notice] = "Ha ocurrido un error"
      render :nuevo_horario, status: :unprocessable_entity
    end
  end

  def horarios
    @horarios = Horario.all
  end

  private

    def horario_params
      params.require(:horario).permit(:dia, :desde, :hasta)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sucursal_params
      params.require(:sucursal).permit(:nombre, :direccion, :tel, :locality_id)
    end
end
