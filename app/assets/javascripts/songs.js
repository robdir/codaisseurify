function createSong(name, album) {
  var newSong = { name: name, album: album };

  var currentPath = window.href.location

  $.ajax({
    type: "POST",
    url: currentPath + "/songs",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);

    var listId = data.id;

    var listItem = $("<li></li>")
      .attr('data-id', listId)
      .html(name, album);

      $("#song-list").append(listItem);

})

.fail(function(error) {
  console.log(error)
  window.alert("Unable to create song.");
});
}

function submitSong(event) {
  event.preventDefault();
  var name = $("#new_song" "input[name=song[name]]").val();
  var album = $("#new_song" "input[name=song[album]]").val();
  createSong(name, album);
  $("#new_song").val(null);
}

$(document).ready(function() {
$("#new_song").bind('submit', submitSong);
});
