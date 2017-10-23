function createSong(name, album) {
  var newSong = { name: name, album: album };
  var currentPath = window.location.pathname;

  $.ajax({
    type: "POST",
    url: "/api" + currentPath + "/songs",
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
  var name = $("#new_song" , "#song_name").val();
  var album = $("#new_song" , "#song_album").val();
  createSong();
  $("#new_song").val(null);
};

$(document).ready(function() {
$("#new_song").bind('submit', submitSong);
});
