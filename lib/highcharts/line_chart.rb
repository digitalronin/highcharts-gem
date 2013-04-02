module Highcharts
  class LineChart < Chart

    private

    def chart_defaults
      hash = super

      hash.chart.type        = 'line'
      hash.chart.zoomType    = 'x'
      hash.chart.marginRight = 240

      hash.xAxis = {
        type: 'datetime',
        dateTimeLabelFormats: {
          day:    '%Y-%m-%d',
          week:   '%Y-%m-%d',
          month:  '%Y-%m-%d',
        }
      }

      hash.plotOptions = {
        series: {
          states: {
            hover: {
              enabled: true,
              lineWidth: 8
            }
          }
        }
      }

      hash.legend = {
        layout:           'vertical',
        align:            'right',
        verticalAlign:    'top',
        x:                -10,
        borderWidth:      1,
        backgroundColor:  'white'
      }

      hash
    end
  end
end
