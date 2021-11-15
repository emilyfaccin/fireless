class FireReportsController < ApplicationController
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
