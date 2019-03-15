class Stack
    def initialize
        @objs = []
    end

    def push(el)
        @objs << el
    end

    def pop
        @objs.pop
    end

    def peek
        @objs[-1]
    end
end

class Queue
    def initialize
        @objs = []
    end

    def enqueue(el)
        @objs << el
    end

    def dequeue
        @objs.shift
    end

    def peek
        @objs[0]
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value] unless get(key)
    end

    def get(key)
        @map.each {|pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        val = get(key)
        pair = nil
        if val
            pair = [key,val]
            @map.delete(pair)
        end
        pair
    end

    def show
        @map.dup
    end
end