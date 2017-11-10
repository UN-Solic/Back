class HumidityMeasuresController < ApplicationController
  before_action :set_humidity_measure, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /humidity_measures
  # GET /humidity_measures.json
  def index
    @humidity_measures = HumidityMeasure.all
  end

  # GET /humidity_measures/1
  # GET /humidity_measures/1.json
  def show
  end

  # GET /humidity_measures/new
  def new
    @humidity_measure = HumidityMeasure.new
  end

  # GET /humidity_measures/1/edit
  def edit
  end

  # POST /humidity_measures
  # POST /humidity_measures.json
  def create
    @humidity_measure = HumidityMeasure.new(humidity_measure_params)

    respond_to do |format|
      if @humidity_measure.save
        format.html { redirect_to @humidity_measure, notice: 'Humidity measure was successfully created.' }
        format.json { render :show, status: :created, location: @humidity_measure }
      else
        format.html { render :new }
        format.json { render json: @humidity_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /humidity_measures/1
  # PATCH/PUT /humidity_measures/1.json
  def update
    respond_to do |format|
      if @humidity_measure.update(humidity_measure_params)
        format.html { redirect_to @humidity_measure, notice: 'Humidity measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @humidity_measure }
      else
        format.html { render :edit }
        format.json { render json: @humidity_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /humidity_measures/1
  # DELETE /humidity_measures/1.json
  def destroy
    @humidity_measure.destroy
    respond_to do |format|
      format.html { redirect_to humidity_measures_url, notice: 'Humidity measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_humidity_measure
      @humidity_measure = HumidityMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def humidity_measure_params
    #  params.require(:humidity_measure).permit(:time, :measure, :device_id)
    #end

    def humidity_measure_params
      params.require(:humidity_measure).permit(:time, :measure, :device_id)
    end
end
