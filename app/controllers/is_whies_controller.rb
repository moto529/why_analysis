# frozen_string_literal: true

class IsWhiesController < ApplicationController
  def new
    @is_why = IsWhy.new
    @analysis = Analysis.find(params[:analysis_id])
    @last_result = @analysis.is_whies.last
    @is_whies = @analysis.is_whies
  end

  def create
    @is_why = IsWhy.new(is_why_params)
    if @is_why.save
      if params[:next]
        redirect_to new_analysis_is_why_path
      elsif params[:finish]
        redirect_to analysis_path(@is_why.analysis_id)
      end
    else
      redirect_to new_analysis_is_why_path
    end
  end

  private

  def is_why_params
    params.require(:is_why).permit(:result).merge(analysis_id: params[:analysis_id])
  end
end
