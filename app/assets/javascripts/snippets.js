
  $(window).load(function(){
    
    var startingTime = parseInt($("#startTime").val());
    var end = $("#endTime").val();
    var endingTime;
    if (end === "0" || isNaN(parseInt(end))) {endTime = false;} else {endingTime = parseInt(end)};
    var snippet = document.getElementById("snippet")

    setTimeout(
    function(){snippet.currentTime = startingTime},
    1000);

    snippet.addEventListener('timeupdate', function(){
      if (endingTime && snippet.currentTime >= (startingTime + endingTime)) {
        snippet.pause();
      }
    })

  })