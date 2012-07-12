class HomeController < ApplicationController
  def index
    @feature_names =
      Dir.entries(File.join(::Rails.root, "public/img/feature-icons")).
        reject { |f| ! f.end_with? ".png" }.
        map    { |f| f.split(".")[0] }.
        sort
  end
end
