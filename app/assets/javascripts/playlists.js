$(function() {

Playlist = {
	// write some function to do add to playlist
	addToPlaylist: function(response){
		var playlists = response.playlists;
		var id = response.clip.id;
		$("#clip"+id+" > #play").empty().append(playlists[0].title);
	}
};
	
$(".playlist").on('click', function(event){
	event.preventDefault();
	// this === the button that was clicked
	// this.closest should === the containing div
	// this.closest.attr("id") should === the clip id
	var id = $(this).closest("div").attr("id").substr(4);
	var playlist_id = $(this).attr("id");

	$.ajax({
		url: "/clips/playlist/"+id,
		type: "POST",
		// data: no data?,
		success: function(response) {
			// call the function from Playlist
			Playlist.addToPlaylist(response);
		}
	});
});

});