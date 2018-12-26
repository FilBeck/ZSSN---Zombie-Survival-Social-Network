class ApiStatisticsController < ApplicationController

  def generate_statistics

    @survivors = Survivor.all
    @inventories = Inventory.all

    infected_percentage = ApiStatistic.infected_percentage(@survivors)
    non_infected_percentage = ApiStatistic.non_infected_percentage(infected_percentage)
    average_resources = ApiStatistic.average_resources_by_survivor(@inventories)
    lost_points = ApiStatistic.points_lost_to_infected(@survivors)

    return render json: {
      "Total infected %": "#{infected_percentage} %",
      "Non-infected %": "#{non_infected_percentage} %",
      "Average resources per survivor": average_resources,
      "Points lost due to infected survivors": lost_points
    }

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_statistic
      @api_statistic = ApiStatistic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_statistic_params
      params.fetch(:api_statistic, {})
    end
end
