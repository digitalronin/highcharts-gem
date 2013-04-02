highcharts-gem
--------------

Gem to simplify generating hashes to feed to highcharts.js to make it draw lovely charts

[Highcharts][] is a javascript library that generates charts. Configuration is done via a hash that can be a bit messy to deal with. This library wraps the highcharts configuration config hash, making it a little easier to deal with.

Currently, only basic line and bar charts have been implemented, using the defaults I needed for a particular project. Adding new chart types should be very easy.

[Highcharts]: http://highcharts.com

Requirements
------------

* Ruby >= 1.9.3
* highcharts.js

EXAMPLE
-------

In your ruby code

          barchart = Highcharts::BarChart.new(
            title:    "My Cool Chart",
            y_title:  "Profit (Billions)",
            renderTo: 'div_where_my_chart_will_appear'
            series:   [
                        {name: "Me", data:   [10, 20, 30, 40, 50]}, 
                        {name: "Them", data: [1, 2, 3, 4, 5]}
                      ]
          )

After instantiation, any value can be altered using either the convenience methods;

* title
* y_title
* renderTo
* series

...or by using addressing the nested hash attributes directly;

        barchart.yAxis.title.text = "My New Y Axis Title"

To render the chart, call the highcharts.js function in your page template, like this;

        new Highcharts.Chart(<%=raw barchart.to_json %>);

