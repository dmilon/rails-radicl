import Chart from "chart.js";

function initChart(id, labels, datasets) {
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
                  gridLines: {
                      display: false
                  }
              }],
              yAxes: [{
                  display: false,
                  gridLines: {
                      display: false
                  },
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });
}

global.initChart = initChart;

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
          display: false,
          text: '# logs by category'
        },
        scale: {
          ticks: {
            beginAtZero: true
          }
        },
        legend: {
          display: true,
          position: 'top',
        }
      }
  });
}

global.initRadarChart = initRadarChart;
