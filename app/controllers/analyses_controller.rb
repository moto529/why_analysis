# frozen_string_literal: true

class AnalysesController < ApplicationController
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

  def show
    @analysis = Analysis.find(params[:id])
    @is_whies = @analysis.is_whies
  end

  private

  def analysis_params
    params.require(:analysis).permit(:target).merge(user_id: session[:user_id])
  end
end
