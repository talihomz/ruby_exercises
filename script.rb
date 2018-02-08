#!/usr/bin/ruby

module Enumerable

  def my_each
    for i in (0...self.length) do
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    for i in (0...self.length) do
      yield(self[i], i)
    end
    self
  end

  def my_select
    results = []

    self.my_each do |item|
      results << item if yield(item)
    end

    results
  end

  def my_all?
    self.my_each do |item|
      return false if !yield(item)
    end

    true
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end

    true
  end

  def my_count
    count = 0
    self.my_each do |item|
      count += 1 if yield(item)
    end

    count
  end

end
