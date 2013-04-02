module Highcharts
  class BarChart < Chart
    private

    def chart_defaults
      hash = super

      hash.chart.type   = 'bar'
      hash.chart.height = 400

      hash.yAxis.min = 0
      hash.yAxis.labels = {overflow: "justify"}

      hash.legend = {enabled: false}

      hash
  end
end
