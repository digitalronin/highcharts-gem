require './spec/spec_helper'

describe Highcharts::HashWithIndifferentContent do
  before do
    @hash = Highcharts::HashWithIndifferentContent.new
  end

  it "sets a value on a nested hash key" do
    @hash.foo = {bar: 'baz'}
    @hash.foo.cat.one = 'two'
    expect(@hash.to_hash).to eq({foo: {bar: 'baz', cat: {one: 'two'}}})
  end

  it "initializes from a nested hash" do
    hash = Highcharts::HashWithIndifferentContent.new(foo: 'bar', baz: {one: 'two'})
    expect(hash.baz.one).to eq('two')
  end

  it "initializes from a hash" do
    hash = Highcharts::HashWithIndifferentContent.new(foo: 'bar')
    expect(hash.foo).to eq('bar')
  end

  it "sets a value to a hash" do
    @hash.foo = {bar: 'baz'}
    expect(@hash.to_hash).to eq({foo: {bar: 'baz'}})
  end

  it "converts to a hash" do
    @hash.foo = 'bar'
    expect(@hash.to_hash).to eq({foo: 'bar'})
  end

  it "returns empty instance for arbitrary key" do
    expect(@hash.foo.to_hash).to eq({})
  end

  it "sets and returns a nested value" do
    @hash.foo.bar = 'baz'
    expect(@hash.foo.bar).to eq('baz')
  end

  it "overwrites a scalar with a hash" do
    @hash.foo = 'bar'
    @hash.foo = {one: 'two'}
    expect(@hash.to_hash).to eq(foo: {one: 'two'})
  end

  it "overwrites a value" do
    @hash.foo = 'bar'
    @hash.foo = 'baz'
    expect(@hash.foo).to eq('baz')
  end

  it "stores and returns an array" do
    @hash.foo = [1,2,3]
    expect(@hash.to_hash).to eq(foo: [1, 2, 3])
  end

  it "sets and returns a value" do
    @hash.foo = 'bar'
    expect(@hash.foo).to eq('bar')
  end

  it "converts to empty hash" do
    expect(@hash.to_hash).to eq({})
  end
end
