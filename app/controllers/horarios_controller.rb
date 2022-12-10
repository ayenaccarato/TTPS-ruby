class HorariosController < ApplicationController
  before_action :set_horario, only: %i[ show edit update destroy ]

  # GET /horarios or /horarios.json
  def index
    @horarios = Horario.sucursal_horarios(params[:id_s])
  end

  # GET /horarios/1 or /horarios/1.json
  def show
  end

  # GET /horarios/new
  def new
    @horario = Horario.new
  end

  # GET /horarios/1/edit
  def edit
  end

  # POST /horarios or /horarios.json
  def create
    @horario = Horario.new(horario_params)
    
    respond_to do |format|
      if Horario.validar_datos(horario_params[:desde], horario_params[:hasta])
        if @horario.save
          format.html { redirect_to horario_url(@horario), notice: "Horario was successfully created." }
          format.json { render :show, status: :created, location: @horario }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @horario.errors, status: :unprocessable_entity }
        end
      else 
        @horario.errors.add(:desde, :invalid)
        @horario.errors.add(:hasta, :invalid)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1 or /horarios/1.json
  def update
    respond_to do |format|
      if Horario.validar_datos(horario_params[:desde], horario_params[:hasta])
      
        if @horario.update(horario_params)
          format.html { redirect_to horario_url(@horario), notice: "Horario was successfully updated." }
          format.json { render :show, status: :ok, location: @horario }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @horario.errors, status: :unprocessable_entity }
        end
      else 
        @horario.errors.add(:desde, :invalid)
        @horario.errors.add(:hasta, :invalid)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1 or /horarios/1.json
  def destroy
    @horario.destroy

    respond_to do |format|
      format.html { redirect_to sucursals_url, notice: "Horario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def horario_params
      params.require(:horario).permit(:dia, :desde, :hasta, :sucursal_id)
    end
end
