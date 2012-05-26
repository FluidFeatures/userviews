
class ControlController < ApplicationController
  
  def change
    puts "GOT change : " + params[:feature_name].to_s + " => " + params[:percent_enabled].to_s
    percent_enabled = params[:percent_enabled].to_i 
    FluidFeatures::Rails.feature_set_enabled_percent(params[:feature_name], percent_enabled)
    render :nothing => true
  end

end
