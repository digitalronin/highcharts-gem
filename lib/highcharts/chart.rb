module Highcharts
  class Chart

    # Default value for max length of data series names
    MAX_DATA_POINT_LABEL_CHARS = 25

    def initialize(options = {})
      dom_id  = options.delete(:renderTo)
      y_title = options.delete(:y_title)
      series  = options.delete(:series)
      @hash   = chart_defaults
      self.renderTo = dom_id if dom_id
      self.y_title  = y_title if y_title
      self.series   = series if series
    end

    def to_json
      to_hash.to_json
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

    def method_missing(method, *args)
      @hash.send(method, args)
    end

    protected

    def truncate_series_name(s)
      s[:name] = s[:name].slice(0, max_data_label_length)
    end

    def chart_defaults
      Highcharts::HashWithIndifferentContent.new(
        credits: { enabled: false },

        title: {
          text: 'dummy_title'
        },
        yAxis: {
          title: {
            text: 'dummy_y_title'
          }
        },
        series: [],
      )
    end
  end
end
