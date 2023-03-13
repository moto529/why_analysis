# frozen_string_literal: true

class AnalysesController < ApplicationController
  include AnalysisCsvModule
  before_action :set_variable, only: %i[show csv_download]
  
  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    if @analysis.save
      redirect_to new_analysis_is_why_path(@analysis.id)
    else
      redirect_to new_analysis_path
    end
  end

  def show; end

  def csv_download
    respond_to do |format|
      format.html
      format.csv do
        generate_csv(@analysis, @is_whies)
      end
    end
  end

  private

  def analysis_params
    params.require(:analysis).permit(:target).merge(user_id: session[:user_id])
  end

  def set_variable
    @analysis = Analysis.find(params[:id])
    @is_whies = @analysis.is_whies
  end
end
