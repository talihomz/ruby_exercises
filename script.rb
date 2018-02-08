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

end
