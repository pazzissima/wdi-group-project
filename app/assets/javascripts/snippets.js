
  $(window).load(function(){
    
    var startingTime = parseInt($("#startTime").val());
    var endingTime;
    if (endingTime === "0") {endTime = false;} else {endingTime = parseInt($("#endTime").val());};
    var snippet = document.getElementById("snippet")

    setTimeout(
    function(){snippet.currentTime = startingTime},
    500);

    snippet.addEventListener('timeupdate', function(){
      if (endingTime && snippet.currentTime >= (startingTime + endingTime)) {
        snippet.pause();
      }
    })

  })