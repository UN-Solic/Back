class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
    render json: @devices
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @irr_measures = Device.find( params[:id] ).irradiance_measures.select('time, measure')
    gon.your_variable = @irr_measures
    render json: @irr_measures
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  #GET /devices/1/get_statistics?start=2017-03-28+04%3A00%3A00&end=2017-03-28+04%3A00%3A00
  def get_statistics
    @irr_measures = Device.find( params[:id] ).irradiance_measures.where( "time BETWEEN ? AND ?", params[:start], params[:end] ).select('time, measure')
    integral = minVal = maxVal = avg = nil
    maxSecondsDiff = 3600.0
    if @irr_measures.size > 0
      integral = avg = 0.0
      lastX = @irr_measures[ 0 ].time
      lastY = minVal = maxVal = @irr_measures[ 0 ].measure
      
      @irr_measures.each do |record|
        elapsed_seconds = (record.time - lastX).to_f
        if elapsed_seconds < maxSecondsDiff then
          integral += elapsed_seconds * (record.measure + lastY)/2.0;
        end
        minVal = [minVal, record.measure].min
        maxVal = [maxVal, record.measure].max
        avg += record.measure
        lastX = record.time
        lastY = record.measure
      end

      avg /= @irr_measures.size.to_f
    end
    render json: {integral: integral, min: minVal, max: maxVal, average: avg}
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name)
    end
end
