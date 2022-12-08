class TurnsController < ApplicationController
  before_action :set_turn, only: %i[ show edit update destroy ]

  # GET /turns or /turns.json
  def index    
    @turns = current_user.turns
  end

  # GET /turns/1 or /turns/1.json
  def show
  end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit
  end

  # POST /turns or /turns.json
  def create
    @turn = Turn.new(turn_params)
    @turn.user_id = current_user.id
  
    respond_to do |format|
      if Sucursal.dia_horario(@turn)
        if @turn.save
          format.html { redirect_to turn_url(@turn), notice: "Turn was successfully created." }
          format.json { render :show, status: :created, location: @turn }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @turn.errors, status: :unprocessable_entity }
        end
      
      else       
        @turn.errors.add(:date, :invalid)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turns/1 or /turns/1.json
  def update
    @user = current_user
    if @user.rol == 'personal_bancario'
      @turn.employee_id = current_user.id 
      @turn.status = 'atendido'
      update_turn(@turn)
    else @user.rol == 'cliente'
        if Turn.validar_fecha_hora(turn_params[:date], turn_params[:sucursal_id])
          update_turn(@turn)
        else 
          @turn.errors.add(:date, :invalid)
          respond_to do |format|
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @turn.errors, status: :unprocessable_entity }
          end
        end
    end
  end

  # DELETE /turns/1 or /turns/1.json
  def destroy
    @turn.destroy

    respond_to do |format|
      format.html { redirect_to turns_url, notice: "Turn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turn_params
      params.require(:turn).permit(:date, :motive, :status, :result, :sucursal_id, :user_id)
    end

    def update_turn(turn)
      respond_to do |format|      
        if turn.update(turn_params)
          format.html { redirect_to turn_url(turn), notice: "Turn was successfully updated." }
          format.json { render :show, status: :ok, location: turn }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: turn.errors, status: :unprocessable_entity }
        end
      end
    end
end
