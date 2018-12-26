class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]

  # GET /inventories
  def index
    @inventories = Inventory.where(survivor_id: params[:survivor_id])

    render json: @inventories
  end

  # GET /inventories/1
  def show
    @inventory = Inventory.where(survivor_id: params[:survivor_id])
    render json: @inventory
  end 

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      render json: @inventory, status: :created, location: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end  
  end

  # PATCH/PUT /inventories/1
  def update
    if @inventory.update(inventory_params)
      render json: @inventory
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  def trade
    if (inventory_trade_params)
      inventory1 = params[:trade_survivor_1]
      inventory2 = params[:trade_survivor_2]

      result = Survivor.trade(inventory1, inventory2)

      render json: { teste: result }
    else
      render json: {teste: "trade failed"}
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
  end

  def deleteall
    @inventories = Inventory.all

    @inventories.each do |i|
      i.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inventory_params
      params.require(:inventory).permit(:survivor_id, :water, :food, :medication, :ammunition)
    end

    def inventory_trade_params
      params.require(:trade_survivor_1).permit(:survivor_id, :water, :food, :medication, :ammunition)
      params.require(:trade_survivor_2).permit(:survivor_id, :water, :food, :medication, :ammunition)
    end
end
