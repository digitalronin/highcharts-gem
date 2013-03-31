require './spec/spec_helper'

describe Highcharts::LineChart do
  before do
    @chart = Highcharts::LineChart.new
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

      series: 'dummy_series',

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
