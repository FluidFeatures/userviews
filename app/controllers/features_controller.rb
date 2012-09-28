
class FeaturesController < ApplicationController

  before_filter :authenticate_user

  def index
    @icons = []
    
    # For each feature you define, with a label, you can wrap that
    # feature's functionality in an "if" block. Here we have defined
    # a feature called "address-book".
    # If this feature has not yet been configured at fluidfeatures.com
    # then this feature will start of enabled for all users.
    if fluidfeature("address-book", { :enabled => true })
      # Add yourlogic here for this feature labeled "address-book"
      # Here we simply log that we want to display the
      # "/img/feature-icons/address-book.png" icon.
      @icons << "address-book"
    end

    # With this feature, "alerts", we have set the default
    # enabled state to false.
    # If this feature has not yet been configured at fluidfeatures.com
    # then this feature will start of disabled for all users.
    if fluidfeature("alerts")
      @icons << "alerts"
    end
    
    # Here are some other features, that we have defined for our
    # application...
    if fluidfeature("attachments")
      # Again, our functionality for this feature is pretty basic.
      @icons << "attachments"
    end
    
    if fluidfeature("badges")
      @icons << "badges"
      sleep 5
    end
    if fluidfeature("banking-integration")
      if rand(10) > 7
        @icons << "banking-integration"
      else
        # Fake some issues with this feature.
        # Phew! Good job we only rolled this feature out
        # to 1% of our users.
        (1..10).each do |n|
          $stderr.puts("PANIC!!! Something went horribly wrong!!! Abort!! Abort!! (this is just an example failure)")
        end
      end
    end


    #
    # Graceful feature rollout example
    #
    # Multiple versions of the same feature
    #

    # "weather" is an existing feature, so we set it's
    # initial enabled state to fully on.
    # This will use the default version name "default",
    # although we could be explicit.
    if fluidfeature("weather", { :enabled => true })
      @icons << "weather"
    end

    # This version of the "weather" feature we're calling "rainbows".
    # When we first rollout this feature, it will be fully disabled.
    if fluidfeature("weather", { :version => "rainbows", :enabled => false })
      @icons << "rainbows"
    end

    if fluidfeature("weather", { :version => "sunshine", :enabled => false })
      @icons << "sunshine"
    end

    #
    # Uncomment these to add more versions of "weather"
    #
    #if fluidfeature("weather", { :version => "rain", :enabled => false })
    #  @icons << "sunny"
    #end
    #if fluidfeature("weather", { :version => "snow", :enabled => false })
    #  @icons << "sunny"
    #end
    #if fluidfeature("weather", { :version => "cloudy", :enabled => false })
    #  @icons << "cloudy"
    #end


    if fluidfeature("bar-charts")
      @icons << "bar-charts"
    end
    if fluidfeature("birthday-alerts")
      @icons << "birthday-alerts"
    end
    if fluidfeature("calendar-integration")
      @icons << "calendar-integration"
    end
    if fluidfeature("chat")
      @icons << "chat"
    end
    if fluidfeature("color-selection")
      @icons << "color-selection"
    end
    if fluidfeature("current-time")
      @icons << "current-time"
    end
    if fluidfeature("delivery-information")
      @icons << "delivery-information"
    end
    if fluidfeature("drawing")
      @icons << "drawing"
    end
    if fluidfeature("drinks-menu")
      @icons << "drinks-menu"
    end
    if fluidfeature("dvd-support")
      @icons << "dvd-support"
    end
    if fluidfeature("email", { :enabled => true })
      @icons << "email"
    end
    if fluidfeature("emoticons")
      @icons << "emoticons"
    end
    if fluidfeature("financial-management")
      @icons << "financial-management"
    end
    if fluidfeature("font-selection")
      @icons << "font-selection"
    end
    if fluidfeature("graphing")
      @icons << "graphing"
    end
    if fluidfeature("help-buttons")
      @icons << "help-buttons"
    end
    if fluidfeature("house")
      @icons << "house"
    end
    if fluidfeature("like-button", { :enabled => true })
      @icons << "like-button"
    end
    if fluidfeature("magic-8-ball")
        @icons << "magic-8-ball"
    end
    if fluidfeature("match-making")
      @icons << "match-making"
    end
    if fluidfeature("new-feature")
      @icons << "new-feature"
    end
    if fluidfeature("painting")
      @icons << "painting"
    end
    if fluidfeature("phone-support")
      @icons << "phone-support"
    end
    if fluidfeature("pie-charts")
      @icons << "pie-charts"
    end
    if fluidfeature("power-up")
      @icons << "power-up"
    end
    if fluidfeature("printing")
      @icons << "printing"
    end
    if fluidfeature("ratings")
      @icons << "ratings"
    end
    if fluidfeature("rewards")
      @icons << "rewards"
    end
    if fluidfeature("search")
      @icons << "search"
    end
    if fluidfeature("security")
      @icons << "security"
    end
    if fluidfeature("shopping-cart")
      @icons << "shopping-cart"
    end
    if fluidfeature("sports-news")
      @icons << "sports-news"
    end
    if fluidfeature("timers")
      @icons << "timers"
    end
    if fluidfeature("traffic-info")
      @icons << "traffic-info"
    end
    if fluidfeature("user-comments")
      @icons << "user-comments"
    end
    if fluidfeature("youtube-integration")
      @icons << "youtube-integration"
    end
    @icons = @icons.sort
    render :layout => false
  end
end

