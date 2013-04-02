require './spec/spec_helper'

describe Highcharts::LineChart do
  before do
    @chart = Highcharts::LineChart.new
  end

  it "outputs to json" do
    chart = Highcharts::LineChart.new(y_title: 'Y Axis Title')
    expect(chart.to_json).to eq(chart.to_hash.to_json)
  end

  it "initialises with y_title" do
    chart = Highcharts::LineChart.new(y_title: 'Y Axis Title')
    expect(chart.to_hash[:yAxis][:title][:text]).to eq("Y Axis Title")
  end

  it "initialises with renderTo" do
    chart = Highcharts::LineChart.new(renderTo: 'highcharts_div')
    expect(chart.to_hash[:chart][:renderTo]).to eq('highcharts_div')
  end

  it "allows configuring max data label length" do
    @chart.max_data_label_length = 10
    s_before = {name: "abcdefghijklmnopqrstuvwxyz", data: [1, 2, 3]}
    @chart.add_series s_before
    # name truncated to 10 chars
    s_after = {name: "abcdefghij", data: [1, 2, 3]}
    expect(@chart.series).to eq([s_after])
  end

  it "truncates data series names on initialisation" do
    s = {name: "abcdefghijklmnopqrstuvwxyz", data: [1, 2, 3]}
    chart = Highcharts::LineChart.new(series: [s])
    expect(chart.series[0][:name]).to eq("abcdefghijklmnopqrstuvwxy")
  end

  it "truncates data series names" do
    s_before = {name: "abcdefghijklmnopqrstuvwxyz", data: [1, 2, 3]}
    @chart.add_series s_before
    # name truncated to 25 chars
    s_after = {name: "abcdefghijklmnopqrstuvwxy", data: [1, 2, 3]}
    expect(@chart.series).to eq([s_after])
  end

  it "adds a data series" do
    s1 = {name: "Series One", data: [1, 2, 3, 4]}
    s2 = {name: "Series Two", data: [2, 3, 4, 5]}
    @chart.add_series s1
    @chart.add_series s2
    expect(@chart.series).to eq([s1, s2])
  end

  it "assigns series" do
    s = {name: "Series One", data: [1, 2, 3, 4]}
    @chart.series = [s]
    expect(@chart.series).to eq([s])
  end

  it "returns y_title" do
    @chart.y_title = 'Y Axis Title'
    expect(@chart.y_title).to eq("Y Axis Title")
  end

  it "overwrites y_title" do
    @chart.y_title = 'Y Axis Title'
    hash = @chart.to_hash
    expect(hash[:yAxis][:title][:text]).to eq("Y Axis Title")
  end

  it "returns renderTo" do
    @chart.renderTo = 'my_dom_id'
    expect(@chart.renderTo).to eq("my_dom_id")
  end

  it "overwrites renderTo" do
    @chart.renderTo = 'my_dom_id'
    hash = @chart.to_hash
    expect(hash[:chart][:renderTo]).to eq("my_dom_id")
  end

  it "returns title" do
    @chart.title = "My Chart Title"
    expect(@chart.title).to eq("My Chart Title")
  end

  it "overwrites title" do
    @chart.title = "My Chart Title"
    hash = @chart.to_hash
    expect(hash[:title]).to eq("My Chart Title")
  end

  it "has defaults" do
    expected = {
      credits: { enabled: false },
      chart: {
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

    expect(@chart.to_hash).to eq(expected)
  end

end
