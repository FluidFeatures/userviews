class HomeController < ApplicationController
  def index
    @features = FluidFeatures::Rails.get_feature_set
  end
end
