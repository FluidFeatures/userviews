
class ControlController < ApplicationController
  
  def change
    percent_enabled = params[:percent_enabled].to_i 
    FluidFeatures::Rails.feature_set_enabled_percent(params[:feature_name], percent_enabled)
    render :nothing => true
  end

end
