$(function() {

Likes = {
	// write some function to do shit
	increment_likes_in_DOM: function(response){
		//grabs total likes and updates likes by 1
		var count = response.count;
		var id = response.clip.id;
		$("#clip"+id+" > p").append(count);
	}
};
	
$(".like").on('click', function(event){
	event.preventDefault();
	// this === the button that was clicked
	// this.closest should === the containing div
	// this.closest.attr("id") should === the clip id
	var id = $(this).closest("div").attr("id").substr(4);

	$.ajax({
		url: "/clips/update/"+id,
		type: "POST",
		// data: no data?,
		success: function(response) {
			// call the function from Likes
			Likes.increment_likes_in_DOM(response);
		}
	});
});

});