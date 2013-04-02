libdir = File.join(File.dirname(__FILE__), 'highcharts')

module Highcharts
end

require 'json'
require File.join(libdir, 'hash_with_indifferent_content')
require File.join(libdir, 'chart')
require File.join(libdir, 'line_chart')
require File.join(libdir, 'bar_chart')
