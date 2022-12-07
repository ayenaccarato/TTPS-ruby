class HorariosController < ApplicationController

  load_and_authorize_resource 

  def index
    @horarios = Horario.where(sucursal_id: params[:id_s])
  end

  def new
    @horario = Horario.new
  end
    
    # POST /sucursals or /sucursals.json
  def create
    @horario = Horario.new(horario_params)

    respond_to do |format|
      if @horario.save
        format.html { redirect_to horario_url(@horario), notice: "Horario was successfully created." }
        format.json { render :show, status: :created, location: @horario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursals/1 or /sucursals/1.json
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to horario_url(@horario), notice: "Horario was successfully updated." }
        format.json { render :show, status: :ok, location: @horario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  private 
    def horario_params
      params.require(:horario).permit(:dia, :desde, :hasta, :sucursal_id)
    end
    
      

end