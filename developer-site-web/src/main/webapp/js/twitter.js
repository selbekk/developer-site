var twitter_url = '/twitter/search.json';

$(document).ready(function() {
	performSearch();
});

function performSearch(){
	// Send JSON request to get mentions
	$.getJSON(twitter_url, 
		function(data) {	
			if(data.results !== undefined) {
				var tweet = data.results[0];
				
				// Check that we got data:
				if(tweet !== undefined) {
									
					// Calculate how many hours ago was the tweet posted
					var tweet_time = relative_time(tweet.created_at);
									
					tweet_html = '<li class="group"><img class="avatar" src="' + 
					tweet.profile_image_url + '"/><div class="avatar-list-text"><div class="question-title">' +
					tweet.from_user + '</div><div class="question-text"><pre>' + 
					tweet.text + '</pre></div>' + '<div class="datetime">' + 
					tweet_time + '</div></div></li>';
					
					// Append strings to divs
					$('ul.avatar-list').append(tweet_html);
				}
			}
			else {
				setTimeout('performSearch()', 2000); 
			}
		}
	);
}

function relative_time(time_value) {
	  var values = time_value.split(" ");
	  time_value = values[2] + " " + values[1] + ", " + values[3] + " " + values[4];
	  var parsed_date = Date.parse(time_value);
	  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
	  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
	  delta = delta + (relative_to.getTimezoneOffset() * 60);

	  if (delta < 60) {
	    return 'less than a minute ago';
	  } else if(delta < 120) {
	    return 'about a minute ago';
	  } else if(delta < (60*60)) {
	    return (parseInt(delta / 60)).toString() + ' minutes ago';
	  } else if(delta < (120*60)) {
	    return 'about an hour ago';
	  } else if(delta < (24*60*60)) {
	    return 'about ' + (parseInt(delta / 3600)).toString() + ' hours ago';
	  } else if(delta < (48*60*60)) {
	    return '1 day ago';
	  } else {
	    return (parseInt(delta / 86400)).toString() + ' days ago';
	  }
	  
}