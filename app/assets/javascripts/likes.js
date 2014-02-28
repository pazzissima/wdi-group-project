$(function() {

Likes = {
	// write some function to do something
	increment_likes_in_DOM: function(response){
		//grabs total likes and updates likes by 1
		var count = response.count;
		var id = response.clip.id;
		$("#clip"+id+" > .count").empty().append(count);
	}
};

$(".like").on('click', function(event){
	event.preventDefault();
	// this === the button that was clicked
	// this.closest should === the containing div
	// this.closest.attr("id") should === the clip id
	var id = $(this).closest("div").attr("id").substr(4);

	var authParam = $('meta[name=csrf-param]').attr('content');
  var authToken = $('meta[name=csrf-token]').attr('content');
  var data = {};
  data[authParam] = authToken;

	$.ajax({
		url: "/clips/update/"+id+".json",
		type: "POST",
		data: data,
		success: function(response) {
			// call the function from Likes
			Likes.increment_likes_in_DOM(response);
		}
	});
});

});