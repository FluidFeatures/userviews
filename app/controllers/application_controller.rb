class ApplicationController < ActionController::Base

  def authenticate_user

    # Proxy cookie through header for this app, since all 
    # our users are using the same browser session.
    if request.headers["fluidfeatures_anonymous_cookie"]
      cookies[:fluidfeatures_anonymous] = request.headers["fluidfeatures_anonymous_cookie"]
    elsif cookies[:fluidfeatures_anonymous]
      cookies.delete(:fluidfeatures_anonymous)
    end

    # Very very basic authentication for demo purposes.
    # Authorization header is just the user_id
    if request.headers['HTTP_AUTHORIZATION']
      user_id = request.headers['HTTP_AUTHORIZATION'].to_i rescue nil
    else
      # anonymous user
      user_id = nil
    end

    # Proxy cookie through header for this app, since all 
    # our users are using the same browser session.
    # This cookie would have been set by fluidfeatures-rails
    if cookies[:fluidfeatures_anonymous]
      response.headers["fluidfeatures_anonymous_cookie"] = cookies[:fluidfeatures_anonymous]
    end

    user_id
  end

  def current_user
    unless @current_user
      user_id = authenticate_user
      user_fullname = request.headers["X-User-Full-Name"]
      @current_user = {
        :id      => user_id,
        :name    => user_fullname,
        :company => "Test Company Ltd.",
        :admin   => false
      }
    end
    @current_user
  end

  #
  # REQUIRED.
  # FluidFeatures will call this to determine if your user is logged in,
  # what the unique id of this user is and any additional attributes
  # you wish to use for selecting users.
  #
  def fluidfeature_current_user(verbose=false)
    if current_user
      if verbose
        {
          :id => @current_user[:id],
          :attributes => {
            # Example attributes for the user.
            # These can be any fields you wish to select users by.
            :name    => @current_user[:name],
            :company  => @current_user[:company],
            :admin    => @current_user[:admin]
          }
        }
      else
        { :id => @current_user.id }
      end
    else
    end
  end

  # OPTIONAL
  # Set default for any new features. These are only used for
  # the first time that FluidFeatures sees a feature. This happens
  # when this feature is deployed for the first time.
  def fluidfeatures_defaults
    {
      # By default unknown features are disabled.
      :enabled => false, # no visible to any users

      # You can also use these values...
      #:enabled => true, # visible to all users (use for depreciating old features)
      #:enabled => 10, # 10 percent of user will see it
      #:enabled => "dev", # only members of the "dev" team (cohort) will see it initially.

      # OPTIONAL
      # Version can be omitted. This is used for A/B testing of a feature.
      #:version => 1        # Can be a number
      :version => "default" # Can be a string
    }
  end

end
