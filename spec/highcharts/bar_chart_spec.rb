require './spec/spec_helper'

describe Highcharts::BarChart do
  before do
    @chart = Highcharts::BarChart.new
  end

  it "has defaults" do
    expected = {
      credits: { enabled: false},
      title: { text: 'dummy_title' },
      yAxis: {
        title:  { text: 'dummy_y_title' },
        min:    0,
        labels: { overflow: 'justify' }
      },
      series: [],
      chart: {
        type:  'bar',
        height: 400
      },
      legend: { enabled: false }
    }

    expect(@chart.to_hash).to eq(expected)
  end
end

