$(document).ready(function() {

  "use strict";

  var total_users = $(".user").length;
  var queue = _.shuffle(_.range(1, total_users + 1));
  var in_progress = 0;
  var max_in_progress = 10;
  var user_cookies = {};

  function start_user_requests() {
    while (in_progress < max_in_progress) {
      user_request();
    }
  }

  function stagger_next_user_request(delay, stagger) {
    // By default, send request in 1-2 second
    if (! delay && delay != 0) {
      delay = 10;
    }
    if (! stagger && stagger != 0) {
      stagger = 50;
    }
    setTimeout(function() { user_request() }, rand_from_range(delay, delay+stagger));
  }

  function handle_response(user_id, html) {
    var $user = $("#user_" + user_id),
        delay = 0;
    in_progress--;

    // add user back to the end of the queue
    queue.push(user_id);
    $user.find(".icons").html(html);

    // Delay for 500ms, minus the time it's already been displayed
    delay = 100 - Math.max(0, ((new Date).getTime() - $user.data("start")));
    setTimeout(function() { $user.removeClass("in_progress") }, delay);
  }

  function auth_headers(user_id) {
    var headers = {};

    if (users_are_signed_in()) {
      // Very very basic authentication :)
      headers["Authorization"] = user_id
    }
    else if (user_cookies[user_id]) {
      // Set the stashed "cookie" for this user.
      // Since we cannot actually pass the same cookie for all users
      // we fake it with a header which the userviews application
      // will proxy.
      headers["fluidfeatures_anonymous_cookie"] = user_cookies[user_id]
      //$.cookie("fluidfeatures_anonymous", user_cookies[user_id]);
    }
    else {
      delete headers["fluidfeatures_anonymous_cookie"];
      //$.removeCookie("fluidfeatures_anonymous");
    }
    return headers;
  }

  function user_request() {
    var user_id = null,
        $user = null;

    if ( ! running() || in_progress >= max_in_progress) {
      return;
    }

    user_id = queue.shift();
    in_progress++;

    $user = $("#user_" + user_id);

    $user.addClass("in_progress");
    $user.data("start", (new Date).getTime());

    $.ajax(
      "/features",
      {
        headers: auth_headers(user_id)
      }
    ).success(function(html, textStatus, jqXHR) {
      // Stash cookie from this user
      user_cookies[user_id] = jqXHR.getResponseHeader("fluidfeatures_anonymous_cookie");
      handle_response(user_id, html);      
      stagger_next_user_request();
    }).fail(function(xhr) {
      handle_response(user_id, "Response failed");  
      // If we failed, try again in 2-5 seconds
      stagger_next_user_request(2000, 3000);
    });
  }

  function rand_from_range(from, to) {
    return Math.floor((Math.random()*(to-from))+from);
  }

  function running() {
    return $("input[name='running']").attr('checked');
  }

  function users_are_signed_in() {
    return $("input[name='signed-in-users']").attr('checked');
  }

  $("input[name='running']").live("change", function() {
    if (running()) {
      start_user_requests();
    }
  });

  $("input[name='show-goals']").live("change", function() {
    if ($(this).attr('checked')) {
      $(".goals").removeClass("hidden");
    }
    else {
      $(".goals").addClass("hidden");
    }
  });

  $(".goals button").live("click", function() {
    var $user = $(this).closest(".user");
    var user_id = $user.data("user-id");
    var goal_name = $(this).data("goal-name");
    var goal_version = $(this).data("goal-version");
    var url = "/fluidgoal/" + goal_name;
    if (goal_version) {
      url += "/" + goal_version;
    }
    $.ajax(
      url,
      {
        headers: auth_headers(user_id)
      }
    )
  });

  if (running()) {
    start_user_requests();
  }

});
