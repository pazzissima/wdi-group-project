$(function() {

	Playlist = {
		// write some function to do add to playlist
		patchToPlaylist: function(clipId, playlistId){
			var url = "/clips/" + clipId + "/playlist/" + playlistId;
			var data = {};
			var authParam = $('meta[name=csrf-param]').attr('content');
			var authToken = $('meta[name=csrf-token]').attr('content');
			data[authParam] = authToken;

			$.ajax({
				type: 'patch',
				url: url,
				data: data,
				success: function(){
					Playlist.added(playlistId);
				}
			});
		},

		added: function(playlistId){
			$("#playlist"+playlistId > span).removeClass().addClass("glyphicon glyphicon-ok");
		}
	};

	$(".playlist").on('click', function(event){
		event.preventDefault();
		// this === the button that was clicked
		// this.closest should === the containing div
		// this.closest.attr("id") should === the clip id
		var clipId = $(this).closest("div").attr("id").substr(4);
		var playlistId = $(this).attr("id").substr(8);

		Playlist.patchToPlaylist(clipId, playlistId);
	});

});