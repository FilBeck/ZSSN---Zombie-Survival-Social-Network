class InfectionReportsController < ApplicationController
  before_action :set_infection_report, only: [:show, :update, :destroy]

  # GET /infection_reports
  def index
    @infection_reports = InfectionReport.all

    render json: @infection_reports
  end

  # GET /infection_reports/1
  def show
    render json: @infection_report
  end

  # POST /infection_reports
  def create

    report_sent = InfectionReport.where("reporter_id = ? AND survivor_reported_id = ?", params[:reporter_id], params[:survivor_reported_id])

    if report_sent.count > 0
      return render json: {teste: report_sent, error: "Person already reported by this user. (cheating not allowed)"}, status: :unprocessable_entity
    end

    @infection_report = InfectionReport.new(infection_report_params)

    if @infection_report.save

      survivor = Survivor.find(params[:survivor_reported_id])
      survivorReports = InfectionReport.where("survivor_reported_id = ?", params[:survivor_reported_id])

      if survivorReports.count >= 3
        survivor.mark_as_infected survivor

        message = "#{survivor.name} now declared an infected!"
      else
        message = "#{survivor.name} is #{3 - survivorReports.count} from be declared infected"
      end

      render json: {infection_report: @infection_report, msg: message}, status: :created, location: @infection_report
    else
      render json: @infection_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /infection_reports/1
  def destroy
    @infection_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infection_report
      @infection_report = InfectionReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def infection_report_params
      #params.fetch(:infection_report, {})
      params.require(:infection_report).permit(:reporter_id, :survivor_reported_id)
    end
end 
