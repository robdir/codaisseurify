var currentPath = window.location.pathname;

// this is the DOM that will have to happen to append the page - call in ajax success
function createSongDOM(name, album, id) {
  var liSong = $("<li></li>");
  liSong.attr('data-id', id);
  liSong.html("\"" + name + "\" -- \"" + album + "\"");
  $('.song-list').append(liSong);

  var deleteLink = $('<a></a>');
  deleteLink.html('Delete');
  deleteLink.addClass('delete-single');
  deleteLink.on('click', deleteSongAjax);
  liSong.append($("<br/>"));
  liSong.append(deleteLink);
}

// communication with API_controller, posting required params
function postSongAjax(event) {
  event.preventDefault();
  var inputField = $('#new_song');
  var songName = $("#song_name").val();
  var songAlbum = $("#song_album").val();
  var newSong = { name: songName, album: songAlbum };
    $.ajax({
      method: "POST",
      url: `/api` + currentPath + `/songs/`,
        data: {
        song: newSong
      }
    })
    .done(function (data) {
        createSongDOM(data.name, data.album, data.id);
        $("#song_name").val(null);
        $("#song_album").val(null);
      }).fail(function(error) {
        console.log(error)
        window.alert("Unable to create song.");
    });
}


// DOM that needs to occur to append HTML
function deleteSongDOM(songId) {
  $('[data-id =' + songId + ']').remove();
}

// communication with API for delete(single) request
function deleteSongAjax(event) {
  var liSong = $(event.target.parentElement);
  var songId = liSong.attr('data-id');
    $.ajax({
      method: 'DELETE',
      url: "/api" + currentPath + "/songs/" + songId,
    }).success(function () {
        deleteSongDOM(songId);
   }).fail(function(error) {
        console.log(error)
        window.alert('Unable to delete song.');
    });
 }


// delete-all loop
$(document).on('click', ".delete-all", function(){
  var songLi = $(".song-list-each");
  $.each($(songLi), function(){
  var songId = $(this).attr('data-id');
    $.ajax({
      type: "DELETE",
          url: `/api` + currentPath + `/songs/` + songId
      }).success(function(){
        $('[data-id =' + songId + ']').remove();
    });
  });
});

// event listeners
$(document).ready(function() {
  $("#new_song").bind('submit', postSongAjax);
  $(".delete-single").on('click', deleteSongAjax);
});

