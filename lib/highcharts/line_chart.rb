class Highcharts::LineChart
  def initialize(options = {})
    @hash = Highcharts::HashWithIndifferentContent.new(line_chart_defaults.merge(options))
  end

  def to_hash
    @hash.to_hash
  end

  def renderTo=(string)
    @hash.chart.renderTo = string
  end

  def renderTo
    @hash.chart.renderTo
  end

  def title=(string)
    @hash.title = string
  end

  def title
    @hash.title
  end

  def y_title=(string)
    @hash.yAxis.title.text = string
  end

  def y_title
    @hash.yAxis.title.text
  end

  def add_series(s)
    @hash.series << s
  end

  def series=(arr)
    @hash.series = arr
  end

  def series
    @hash.series
  end

  private

  def line_chart_defaults
    {
      chart: {
        renderTo:     'dummy_dom_id',
        type:         'line',
        zoomType:     'x',
        marginRight:  240
      },
      title: {
        text: 'dummy_title'
      },
      xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: {
          day:    '%Y-%m-%d',
          week:   '%Y-%m-%d',
          month:  '%Y-%m-%d',
        }
      },
      yAxis: {
        title: {
          text: 'dummy_y_title'
        }
      },

      plotOptions: {
        series: {
          states: {
            hover: {
              enabled: true,
              lineWidth: 8
            }
          }
        }
      },

      series: [],

      legend: {
        layout:           'vertical',
        align:            'right',
        verticalAlign:    'top',
        x:                -10,
        borderWidth:      1,
        backgroundColor:  'white'
      },
      credits: { enabled: false }
    }
  end
end
