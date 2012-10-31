
class FeaturesController < ApplicationController

  def index
    @icons = []
    
    # For each feature you define, with a label, you can wrap that
    # feature's functionality in an "if" block. Here we have defined
    # a feature called "address-book".
    # If this feature has not yet been configured at fluidfeatures.com
    # then this feature will start of enabled for all users.
    if ff? "address-book", true
      # Add yourlogic here for this feature labeled "address-book"
      # Here we simply log that we want to display the
      # "/img/feature-icons/address-book.png" icon.
      @icons << "address-book"
    end

    # With this feature, "alerts", we have set the default
    # enabled state to false.
    # If this feature has not yet been configured at fluidfeatures.com
    # then this feature will start of disabled for all users.
    if ff? "alerts"
      @icons << "alerts"
    end
    
=begin
    # Here are some other features, that we have defined for our
    # application...
    if ff? "attachments"
      # Again, our functionality for this feature is pretty basic.
      @icons << "attachments"
    end

    if ff? "badges"
      @icons << "badges"
      sleep 5
    end
    if ff? "banking-integration"
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
=end


    #
    # Graceful feature rollout example
    #
    # Multiple versions of the same feature
    #

    # "weather" is an existing feature, so we set it's
    # initial enabled state to fully on.
    # This will use the default version name "default",
    # although we could be explicit.
    if ff? "weather", true
      @icons << "weather"
    end

    # This version of the "weather" feature we're calling "rainbows".
    # When we first rollout this feature, it will be fully disabled.
    if ff? "weather", "rainbows", false
      @icons << "rainbows"
    end

    if ff? "weather", "sunshine", false
      @icons << "sunshine"
    end

    #
    # Uncomment these to add more versions of "weather"
    #
    #if ff? "weather", "rain", false
    #  @icons << "sunny"
    #end
    #if ff? "weather", "snow", false
    #  @icons << "sunny"
    #end
    #if ff? "weather", "cloudy", false
    #  @icons << "cloudy"
    #end

=begin
    if ff? "bar-charts"
      @icons << "bar-charts"
    end
    if ff? "birthday-alerts"
      @icons << "birthday-alerts"
    end
    if ff? "calendar-integration"
      @icons << "calendar-integration"
    end
    if ff? "chat"
      @icons << "chat"
    end
    if ff? "color-selection"
      @icons << "color-selection"
    end
    if ff? "current-time"
      @icons << "current-time"
    end
    if ff? "delivery-information"
      @icons << "delivery-information"
    end
    if ff? "drawing"
      @icons << "drawing"
    end
    if ff? "drinks-menu"
      @icons << "drinks-menu"
    end
    if ff? "dvd-support"
      @icons << "dvd-support"
    end
    if ff? "email", true
      @icons << "email"
    end
    if ff? "emoticons"
      @icons << "emoticons"
    end
    if ff? "financial-management"
      @icons << "financial-management"
    end
    if ff? "font-selection"
      @icons << "font-selection"
    end
    if ff? "graphing"
      @icons << "graphing"
    end
    if ff? "help-buttons"
      @icons << "help-buttons"
    end
    if ff? "house"
      @icons << "house"
    end
    if ff? "like-button", true
      @icons << "like-button"
    end
    if ff? "magic-8-ball"
        @icons << "magic-8-ball"
    end
    if ff? "match-making"
      @icons << "match-making"
    end
    if ff? "new-feature"
      @icons << "new-feature"
    end
    if ff? "painting"
      @icons << "painting"
    end
    if ff? "phone-support"
      @icons << "phone-support"
    end
    if ff? "pie-charts"
      @icons << "pie-charts"
    end
    if ff? "power-up"
      @icons << "power-up"
    end
    if ff? "printing"
      @icons << "printing"
    end
    if ff? "ratings"
      @icons << "ratings"
    end
    if ff? "rewards"
      @icons << "rewards"
    end
    if ff? "search"
      @icons << "search"
    end
    if ff? "security"
      @icons << "security"
    end
    if ff? "shopping-cart"
      @icons << "shopping-cart"
    end
    if ff? "sports-news"
      @icons << "sports-news"
    end
    if ff? "timers"
      @icons << "timers"
    end
    if ff? "traffic-info"
      @icons << "traffic-info"
    end
    if ff? "user-comments"
      @icons << "user-comments"
    end
    if ff? "youtube-integration"
      @icons << "youtube-integration"
    end
=end
    @icons = @icons.sort
    render :layout => false
  end
end

