
def bubble_sort(array)

  stop = false

  until stop do
    stop = true
    for a in (0...array.length - 1)
      left = array[a]
      right = array[a + 1]

      if( left > right )
        array[a], array[a + 1] = array[a + 1], array[a]
        stop = false
      end
    end
  end

  return array
end


def bubble_sort_by(array)
  stop = false

  until stop do
    stop = true
    for a in (0...array.length - 1)

      res = yield(array[a], array[a + 1])
      if res == 1
        array[a], array[a + 1] = array[a + 1], array[a]
        stop = false
      end
    end
  end

  return array
end

p bubble_sort_by(["one", "three", "seventy", "a", "aaaaaaaaaaaaaaaaaa"]) { |a, b| b.length <=> a.length }
