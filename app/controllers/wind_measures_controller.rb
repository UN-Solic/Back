class WindMeasuresController < ApplicationController
  before_action :set_wind_measure, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /wind_measures
  # GET /wind_measures.json
  def index
    @wind_measures = WindMeasure.all
  end

  # GET /wind_measures/1
  # GET /wind_measures/1.json
  def show
  end

  # GET /wind_measures/new
  def new
    @wind_measure = WindMeasure.new
  end

  # GET /wind_measures/1/edit
  def edit
  end

  # POST /wind_measures
  # POST /wind_measures.json
  def create
    @wind_measure = WindMeasure.new(wind_measure_params)

    respond_to do |format|
      if @wind_measure.save
        format.html { redirect_to @wind_measure, notice: 'Wind measure was successfully created.' }
        format.json { render :show, status: :created, location: @wind_measure }
      else
        format.html { render :new }
        format.json { render json: @wind_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wind_measures/1
  # PATCH/PUT /wind_measures/1.json
  def update
    respond_to do |format|
      if @wind_measure.update(wind_measure_params)
        format.html { redirect_to @wind_measure, notice: 'Wind measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @wind_measure }
      else
        format.html { render :edit }
        format.json { render json: @wind_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wind_measures/1
  # DELETE /wind_measures/1.json
  def destroy
    @wind_measure.destroy
    respond_to do |format|
      format.html { redirect_to wind_measures_url, notice: 'Wind measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wind_measure
      @wind_measure = WindMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def wind_measure_params
    #  params.require(:wind_measure).permit(:time, :measure, :device_id)
    #end

    def wind_measure_params
      params.require(:wind_measure).permit(:time, :measure, :device_id)
    end
end
