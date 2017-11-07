class TempMeasuresController < ApplicationController
  before_action :set_temp_measure, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /temp_measures
  # GET /temp_measures.json
  def index
    @temp_measures = TempMeasure.all
  end

  # GET /temp_measures/1
  # GET /temp_measures/1.json
  def show
  end

  # GET /temp_measures/new
  def new
    @temp_measure = TempMeasure.new
  end

  # GET /temp_measures/1/edit
  def edit
  end

  # POST /temp_measures
  # POST /temp_measures.json
  def create
    @temp_measure = TempMeasure.new(temp_measure_params)

    respond_to do |format|
      if @temp_measure.save
        format.html { redirect_to @temp_measure, notice: 'Temp measure was successfully created.' }
        format.json { render :show, status: :created, location: @temp_measure }
      else
        format.html { render :new }
        format.json { render json: @temp_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_measures/1
  # PATCH/PUT /temp_measures/1.json
  def update
    respond_to do |format|
      if @temp_measure.update(temp_measure_params)
        format.html { redirect_to @temp_measure, notice: 'Temp measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @temp_measure }
      else
        format.html { render :edit }
        format.json { render json: @temp_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_measures/1
  # DELETE /temp_measures/1.json
  def destroy
    @temp_measure.destroy
    respond_to do |format|
      format.html { redirect_to temp_measures_url, notice: 'Temp measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_measure
      @temp_measure = TempMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def temp_measure_params
    #  params.require(:temp_measure).permit(:time, :measure, :device_id)
    #end

    def temp_measure_params
      params.require(:temp_measure).permit(:time, :measure, :device_id)
    end
end
