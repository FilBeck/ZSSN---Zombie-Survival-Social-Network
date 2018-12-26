class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :destroy]

  # GET /survivors
  def index
    @survivors = Survivor.all

    render json: @survivors
  end

  # GET /survivors/1
  def show
    render json: @survivor
  end

  def show_infected
    @infected = Survivor.where(infected: 1)

    render json: @infected
  end

  # POST /survivors
  def create
    @survivor = Survivor.new(survivor_params)
   
    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /survivors/1
  def update
    if @survivor.update(survivor_update_params)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /survivors/1
  def destroy
    @survivor.destroy
  end

  # DELETE /killallsurvivors
  def deleteall
    @survivors = Survivor.all

    @survivors.each { |s|
      s.destroy
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :gender, :infected, :geo_location, inventory_attributes: [:water, :food, :medication, :ammunition])
    end

    def survivor_update_params
      params.require(:survivor).permit(:geo_location)
    end

end
