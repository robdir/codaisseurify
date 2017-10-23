function updateSongs() {}

function createSong(name, album) {
  var newSong = { name: name, album: album };

  $.ajax({
    type: "POST",
    url: "#{artistId}" + "/songs.json",
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
  error_message = error.responseJSON.title[0];
  showError(error_message);
});
}

function submitSong(event) {
  event.preventDefault();
  var name = $("#new_song input[name=song[name]]").val();
  var album = $("#new_song input[name=song[album]]").val();
  createSong(name, album);
  $("#new_song").val(null);
}


// listeners
$("#new_song").bind('submit', submitSong);
