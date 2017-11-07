class IrradianceMeasuresController < ApplicationController
  before_action :set_irradiance_measure, only: [:show, :edit, :update, :destroy]


  # GET /irradiance_measures
  # GET /irradiance_measures.json
  def index
    @irradiance_measures = IrradianceMeasure.all.select(:time,:measure)
    #@irradiance_measures = IrradianceMeasure.all.pluck(:time,:measure)
    render json:@irradiance_measures.to_json(:only =>[:time,:measure])
  end

  # GET /irradiance_measures/1
  # GET /irradiance_measures/1.json
  def show
  end

  # GET /irradiance_measures/new
  def new
    @irradiance_measure = IrradianceMeasure.new
  end

  # GET /irradiance_measures/1/edit
  def edit
  end

  # POST /irradiance_measures
  # POST /irradiance_measures.json
  def create
    @irradiance_measure = IrradianceMeasure.new(irradiance_measure_params)

    respond_to do |format|
      if @irradiance_measure.save
        format.html { redirect_to @irradiance_measure, notice: 'Irradiance measure was successfully created.' }
        format.json { render :show, status: :created, location: @irradiance_measure }
      else
        format.html { render :new }
        format.json { render json: @irradiance_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /irradiance_measures/1
  # PATCH/PUT /irradiance_measures/1.json
  def update
    respond_to do |format|
      if @irradiance_measure.update(irradiance_measure_params)
        format.html { redirect_to @irradiance_measure, notice: 'Irradiance measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @irradiance_measure }
      else
        format.html { render :edit }
        format.json { render json: @irradiance_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /irradiance_measures/1
  # DELETE /irradiance_measures/1.json
  def destroy
    @irradiance_measure.destroy
    respond_to do |format|
      format.html { redirect_to irradiance_measures_url, notice: 'Irradiance measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_irradiance_measure
      @irradiance_measure = IrradianceMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def irradiance_measure_params
      params.fetch(:irradiance_measure, {})
    end
end
