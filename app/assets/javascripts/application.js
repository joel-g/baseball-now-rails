//= require rails-ujs
//= require_tree .
//= require Chart.bundle
//= require chartkick

var addPlayerDataListener = function() {
  $('.add-player-data').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      method: 'GET',
      url: 'players/new'
    }).done(function(response){
      $('.form-target').html(response)
    })
  })
}



$(document).ready(function() {
  addPlayerDataListener();
});
