
 $(document).on("ready page:load", function() {
    
    var startingTime = parseInt($("#startTime").val());
    var end = $("#endTime").val();
    var endingTime;
    if (end === "0" || isNaN(parseInt(end))) {endTime = false;} else {endingTime = parseInt(end);}
    var snippet = document.getElementById("snippet");



    snippet.addEventListener('loadedmetadata', function(){
      this.currentTime = startingTime;
    });

    snippet.addEventListener('timeupdate', function(){
      if (endingTime && snippet.currentTime >= (startingTime + endingTime)) {
        snippet.pause();
      }
    });

  });