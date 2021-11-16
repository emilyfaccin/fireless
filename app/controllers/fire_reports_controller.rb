class FireReportsController < ApplicationController
  def index
    @fire_reports = FireReport.to_present.order(created_at: :desc)

    render json: @fire_reports
  end

  def create
    @fire_report = FireReport.new(fire_report_params)
    saved = @fire_report.save

    render status: :ok if saved
  end

  private

  def fire_report_params
    params.require(:fire_report).permit(:street, :district, :size)
  end
end
