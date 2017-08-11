//= require rails-ujs
//= require_tree .

function addPlayerDataListener() {
  $('.add-player-data').on('click', function(e) {
    e.preventDefault();
    $.get({
      url: 'players/new'
    }).done(function(response){
      $('.form-target').html(response)
      $('.errors').html('');
    })
  })
}

function gatherDotsData() {
  var output;
  $.ajax({
    method: 'GET',
    url: '/player_data',
    async: false
  }).done(function(response){
    output = response;
  })
  return output;
}

$(document).ready(function() {
  addPlayerDataListener();
  makeAChart(gatherDotsData());
});


function makeAChart(data){
  Highcharts.chart('high-chart', {
      chart: {
          type: 'scatter',
          zoomType: 'xy'
      },
      title: {
          text: 'Batters by Hits and Pitches Faced'
      },
      xAxis: {
          title: {
              enabled: true,
              text: 'Pitches Faced'
          },
          startOnTick: true,
          endOnTick: true,
          showLastLabel: true
      },
      yAxis: {
          title: {
              text: 'Hits'
          }
      },
      plotOptions: {
          series: {
            point: {
              events: {
                click: function(e){
                  $.get({
                    url: e.point.series.userOptions.url
                  }).done(function(response){
                    $('.form-target').html(response);
                    $('.errors').html('');
                  })
                }
              }
            }
          },
          scatter: {
              marker: {
                  radius: 5,
                  states: {
                      hover: {
                          enabled: true,
                          lineColor: 'rgb(100,100,100)'
                      }
                  }
              },
              states: {
                  hover: {
                      marker: {
                          enabled: false
                      }
                  }
              },
              tooltip: {
                  headerFormat: '<b>{series.name}</b><br>',
                  pointFormat: '{point.x} Pitches, {point.y} Hits'
              }
          }
      },
      series: data,
  });
}
