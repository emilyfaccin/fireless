class FireReportsController < ApplicationController
  def index
    @totals = FireReport.select(:size).group(:size).count
    @fire_reports = FireReport.to_present.order(created_at: :desc).to_a

    render json: @fire_reports.unshift(@totals)
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
