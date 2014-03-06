var initAudioPlayer;

var ready = function(path) {
  return $('#jquery_jplayer_1').jPlayer("setMedia", {
    mp3: path
  });
}

initAudioPlayer = function() {
  return $('#jquery_jplayer_1').jPlayer({
    
    swfPath: "/assets/javascripts",
    supplied: "mp3"
  });
};

