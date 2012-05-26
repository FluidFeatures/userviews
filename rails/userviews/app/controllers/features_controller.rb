
class FeaturesController < ApplicationController

  before_filter :authenticate_user
  
  def authenticate_user
    user_id = nil
    begin
      # Very very basic authentication for demo purposes.
      # Authorization header is just the user_id
      user_id = request.headers['HTTP_AUTHORIZATION'].to_i
    rescue
      user_id = nil
    end
    if user_id and user_id > 0
      # This is important. 
      # You need to tell fluidfeatures who this request is
      # for. This a unique id for this user, so that
      # fluidfeatures can manage the features for this user.
      fluidfeatures_set_user_id(user_id)
    else
      render :status => 403, :nothing => true
    end
  end
  
  def user_id
    # defined a way to retrieve the user_id for this request
    345
  end

  def index
    @icons = []
    
    # For each feature you define, with a label, you can wrap that
    # feature's functionality in an "if" block. Here we have defined
    # a feature called "address-book".
    # If this feature has not yet been configured at fluidfeatures.com
    # then this feature will start of enabled for all users.
    if fluidfeature("address-book", true)
      # Add yourlogic here for this feature labeled "address-book"
      # Here we simply log that we want to display the
      # "/img/feature-icons/address-book.png" icon.
      @icons << "address-book"
    end

    # With this feature, "alerts", we have set the default
    # enabled state to false.
    # If this feature has not yet been configured at fluidfeatures.com
    # then this feature will start of disabled for all users.
    if fluidfeature("alerts", false)
      @icons << "alerts"
    end
    
    # Here are some other features, that we have defined for our
    # application...
    if fluidfeature("attachments", false)
      # Again, our functionality for this feature is pretty basic.
      @icons << "attachments"
    end
    
    if fluidfeature("badges", false)
      # Fake duration this feature takes to run.
      # In real-life this would be db queries etc.
      # Phew! Good job we tested this feature on 10%
      # of our user-base. Otherwise this may have slowed down
      # the whole site. We'll need to buy more hardware
      # before we roll this feature out any more.
      sleep 0.004
      @icons << "badges"
    end
    if fluidfeature("banking-integration", false)
      # Fake some issues with this feature.
      # Phew! Good job we only rolled this feature out
      # to 1% of our users.
      (1..10).each do |n|
        $stderr.puts("PANIC!!! Something went horribly wrong!!! Abort!! Abort!!")
      end
      @icons << "banking-integration"
    end
    if fluidfeature("bar-charts", false)
      @icons << "bar-charts"
    end
    if fluidfeature("birthday-alerts", false)
      @icons << "birthday-alerts"
    end
    if fluidfeature("calendar-integration", false)
      @icons << "calendar-integration"
    end
    if fluidfeature("chat", false)
      @icons << "chat"
    end
    if fluidfeature("color-selection", false)
      @icons << "color-selection"
    end
    if fluidfeature("current-time", false)
      @icons << "current-time"
    end
    if fluidfeature("delivery-information", false)
      @icons << "delivery-information"
    end
    if fluidfeature("drawing", false)
      @icons << "drawing"
    end
    if fluidfeature("drinks-menu", false)
      @icons << "drinks-menu"
    end
    if fluidfeature("dvd-support", false)
      @icons << "dvd-support"
    end
    if fluidfeature("email", true)
      @icons << "email"
    end
    if fluidfeature("emoticons", false)
      @icons << "emoticons"
    end
    if fluidfeature("financial-management", false)
      @icons << "financial-management"
    end
    if fluidfeature("font-selection", false)
      @icons << "font-selection"
    end
    if fluidfeature("graphing", false)
      @icons << "graphing"
    end
    if fluidfeature("help-buttons", false)
      @icons << "help-buttons"
    end
    if fluidfeature("house", false)
      @icons << "house"
    end
    if fluidfeature("like-button", true)
      @icons << "like-button"
    end
    if fluidfeature("magic-8-ball", false)
        @icons << "magic-8-ball"
    end
    if fluidfeature("match-making", false)
      @icons << "match-making"
    end
    if fluidfeature("new-feature", false)
      @icons << "new-feature"
    end
    if fluidfeature("painting", false)
      @icons << "painting"
    end
    if fluidfeature("phone-support", false)
      @icons << "phone-support"
    end
    if fluidfeature("pie-charts", false)
      @icons << "pie-charts"
    end
    if fluidfeature("power-up", false)
      @icons << "power-up"
    end
    if fluidfeature("printing", false)
      @icons << "printing"
    end
    if fluidfeature("rainbows", false)
      @icons << "rainbows"
    end
    if fluidfeature("ratings", false)
      @icons << "ratings"
    end
    if fluidfeature("rewards", false)
      @icons << "rewards"
    end
    if fluidfeature("search", false)
      @icons << "search"
    end
    if fluidfeature("security", false)
      sleep 0.001
      @icons << "security"
    end
    if fluidfeature("shopping-cart", false)
      sleep 0.002
      @icons << "shopping-cart"
    end
    if fluidfeature("sports-news", false)
      @icons << "sports-news"
    end
    if fluidfeature("timers", false)
      @icons << "timers"
    end
    if fluidfeature("traffic-info", false)
      sleep 0.002
      @icons << "traffic-info"
    end
    if fluidfeature("user-comments", false)
      @icons << "user-comments"
    end
    if fluidfeature("weather", false)
      @icons << "weather"
    end
    if fluidfeature("youtube-integration", false)
      sleep 0.004
      @icons << "youtube-integration"
    end
    render :layout => false
  end
end

