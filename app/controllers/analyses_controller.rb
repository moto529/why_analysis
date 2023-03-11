class AnalysesController < ApplicationController
  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    if @analysis.save
      redirect_to new_analysis_path, notice: "Great!"
    else
      render :new, notice: "Sorry"
    end
  end

  private
  def analysis_params
    params.require(:analysis).permit(:target).merge(user_id: session[:user_id])
  end
end
