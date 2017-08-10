//= require rails-ujs
//= require_tree .
//= require Chart.bundle
//= require chartkick

let chartData = gatherDotsData();

function addPlayerDataListener() {
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

function gatherDotsData() {
  $.ajax({
    method: 'GET',
    url: '/player_data',
  }).done(function(response){
    return response;
  })
}

$(document).ready(function() {
  addPlayerDataListener();
  gatherDotsData();
  makeAChart(gatherDotsData);
});


function makeAChart(chartData){
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
      series: gatherDotsData()
  });
}
