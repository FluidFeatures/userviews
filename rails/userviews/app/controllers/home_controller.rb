class HomeController < ApplicationController
  def index
    @features = FluidFeatures::Rails.get_feature_set
    puts "GOT FEATURES : " + @features.to_s
  end
end
