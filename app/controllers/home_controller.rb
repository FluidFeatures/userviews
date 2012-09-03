class HomeController < ApplicationController

  FEATURE_ICONS_DIRECTORY = File.join(::Rails.root, "public/img/feature-icons")

  def index
    # Find all the images in the "feature-icons" directory, strip off
    # the directory and extension, to just leave a list of icon names
    @feature_names =
      Dir.entries(File.join(FEATURE_ICONS_DIRECTORY)).
        reject { |f| ! f.end_with? ".png" }.
        map    { |f| f.split(".")[0] }.
        sort
  end
end
