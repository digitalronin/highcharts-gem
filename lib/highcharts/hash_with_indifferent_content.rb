class Highcharts::HashWithIndifferentContent
  def initialize(data = {})
    @data = {}
    data.each do |k,v|
      self.send("#{k}=", v)
    end
  end

  def method_missing(method, *args)
    val = args[0]

    if method =~ /(.+)=$/
      # setter
      key = $1.to_sym
      if args[0].nil?
        @data.delete(key)
      else
        value = val.is_a?(Hash) ? self.class.new(val) : val
        @data[key] = value
      end
    else
      # getter or nested method
      if @data[method]
        @data[method]
      else
        nested = self.class.new
        @data[method.to_sym] = nested
        nested
      end
    end
  end

  def to_hash
    data = {}
    @data.each do |k,v|
      v = v.to_hash if v.is_a?(self.class)
      data[k] = v
    end
    data
  end
end
