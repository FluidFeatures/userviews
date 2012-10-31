class ApplicationController < ActionController::Base

  # fluidfeatures-rails uses a cookie "fluidfeatures_anonymous"
  # to persist anonymous user sessions and ensure that the same
  # user sees the same features each time. 
  # Since we have one browser session supporting many users,
  # we need cannot use the same cookie for each user.
  # Therefore, we intercept the cookie at the end of the request
  # and replace it with a response header (cookie_to_header).
  # Our JavaScript in the browser tracks all the users sends this
  # header back as a request header. We intercept at the beginning
  # of the request (header_to_cookie) and convert back to a cookie,
  # so that fluidfeatures-rails only sees the cookie.
  # This is specific to this demonstration application, and is not
  # required in normal applications.
  before_filter :header_to_cookie
  after_filter :cookie_to_header

  before_filter :authenticate_user

  def header_to_cookie
    # Proxy cookie through header for this app, since all 
    # our users are using the same browser session.
    if request.headers["fluidfeatures_anonymous_cookie"]
      cookies[:fluidfeatures_anonymous] = request.headers["fluidfeatures_anonymous_cookie"]
    elsif cookies[:fluidfeatures_anonymous]
      cookies.delete(:fluidfeatures_anonymous)
    end
  end

  def cookie_to_header
    # Proxy cookie through header for this app, since all 
    # our users are using the same browser session.
    # This cookie would have been set by fluidfeatures-rails
    if cookies[:fluidfeatures_anonymous]
      response.headers["fluidfeatures_anonymous_cookie"] = cookies[:fluidfeatures_anonymous]
    end
  end

  def authenticate_user
    # Very very basic authentication for demo purposes.
    # Authorization header is just the user_id
    if request.headers['HTTP_AUTHORIZATION']
      user_id = request.headers['HTTP_AUTHORIZATION'].to_i rescue nil
    else
      # anonymous user
      user_id = nil
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
        :company_name => "Test Company Ltd.",
        :company_id   => 123,
        # Let's make anyone whose name starts with
        # "A" an admin. Seems fair.
        :admin   => (user_fullname && user_fullname.start_with?("A"))
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
  def fluidfeatures_current_user(verbose=false)
    if current_user
      if verbose
        {
          :id => @current_user[:id],
          :name => @current_user[:name],
          :uniques => {
            :twitter => @current_user[:twitter_id]
          },
          :cohorts => {
            # Example attributes for the user.
            # These can be any fields you wish to select users by.
            :company  => {
              # "display" is used to help you find it in the dashboard.
              # Highly recommended unless you work with ids.
              # This display name can change over time without consequence. 
              :display => @current_user[:company_name],
              # "id" should be unique this this cohort and must be static
              # over time.
              :id      => @current_user[:company_id]
            },
            # For this boolean cohort "true"|"false" is the "display"
            # and the "id"
            :admin    => @current_user[:admin]
          }
        }
      else
        {
          :id => @current_user.id
        }
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
