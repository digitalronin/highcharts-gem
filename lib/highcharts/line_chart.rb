class Highcharts::LineChart

  # Default value for max length of data series names
  MAX_DATA_POINT_LABEL_CHARS = 25

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
    truncate_series_name(s)
    @hash.series << s
  end

  def series=(arr)
    @hash.series = []
    arr.map {|s| add_series(s)}
  end

  def series
    @hash.series
  end

  def max_data_label_length=(length)
    @max_data_label_length ||= length
  end

  def max_data_label_length
    @max_data_label_length || MAX_DATA_POINT_LABEL_CHARS
  end

  private

  def truncate_series_name(s)
    s[:name] = s[:name].slice(0, max_data_label_length)
  end

  def line_chart_defaults
    {
      credits: { enabled: false },

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
    }
  end
end
