class TradesController < ApplicationController

	def update
		
	end	

	def trade_params
      params.require(:inventory).permit(inventory_1: [:water, :food, :medication, :ammunition],
      									inventory_2: [:water, :food, :medication, :ammunition])
    end

end