This application demonstrations feature management with FluidFeatures.com

Each of the boxes on the screen represents the browser view of one user. So if there are 200 boxes, that's 200 users hitting the rails application concurrently.

When a user request is initiated, the user's box will turn yellow. Shortly after the user's request comes back from the server the box will revert to a white background. This is to visualize the requests as they are happening.

The icons represent the enabled features for that user. You can control which users see which versions of which features from the control panel on you fluidfeatures.com dashboard.

FLUIDFEATURES_* are environment variables passed to the application. You can find these on your fluidfeatures.com dashboard and they are specific to your instance of the application. Do NOT use the ones listed below. These are examples only and will not work for you.

Run with JRuby...

    jruby -S bundle install
    
    FLUIDFEATURES_APPID=thisisnotarealappid \
    FLUIDFEATURES_SECRET=thisisnotarealsecret \
    FLUIDFEATURES_BASEURI=https://www.fluidfeatures.com/service \
    jruby -S trinidad

Run with Ruby...

    bundle install
    
    FLUIDFEATURES_APPID=thisisnotarealappid \
    FLUIDFEATURES_SECRET=thisisnotarealsecret \
    FLUIDFEATURES_BASEURI=https://www.fluidfeatures.com/service \
    script/rails server


