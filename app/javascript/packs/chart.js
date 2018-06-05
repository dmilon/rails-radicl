import Chart from "chart.js";

function initChart(id, labels, datasets) {
  var ctx = document.getElementById(id).getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'bar',
      // changement de style librairie et options
      data: {
          labels: labels,
          datasets: datasets
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          },
          title: {
            display: true,
            text: '#'
          },
          legend: {
            display: true,
            position: 'right',
          }
      }
  });
}

global.initChart = initChart;

function initStackedChart(id, labels, datasets) {
  var ctx = document.getElementById(id).getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: labels,
          datasets: datasets
      },
      options: {
          scales: {
            xAxes: [{
              stacked: true,
            }],
            yAxes: [{
              stacked: true
            }]
          },
          title: {
            display: true,
            text: '#'
          },
          legend: {
            display: true,
            position: 'right',
          }
      }
  });
}

global.initStackedChart = initStackedChart;

function initRadarChart(id, labels, datasets) {
  var ctx = document.getElementById(id).getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'radar',
      data: {
          labels: labels,
          datasets: datasets,
          fill: false,
      },
      options: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: '#'
        },
        scale: {
          ticks: {
            beginAtZero: true
          }
        },
        title: {
          display: true,
          text: '#'
        },
        legend: {
          display: true,
          position: 'right',
        }
      }
  });
}

global.initRadarChart = initRadarChart;

function initLineChart(id, labels, datasets) {
  var ctx = document.getElementById(id).getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: labels,
          datasets: datasets,
          fill: false,
      },
      options: {
          scales: {
            xAxes: [{
              stacked: true,
            }],
            yAxes: [{
              stacked: true
            }]
          },
          title: {
            display: true,
            text: '#'
          },
          legend: {
            display: true,
            position: 'right',
          }
      }
  });
}

global.initLineChart = initLineChart;



