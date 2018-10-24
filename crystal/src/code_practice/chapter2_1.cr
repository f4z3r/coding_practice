# Write code to remove duplicates from an unsorted linked list.
#
# Follow up
#
# How would you solve this if a temporary buffer is not allowed.

module CodePractice
  class Node
    getter :data
    property :next

    def initialize(@data : Int32, @next : Node? = nil)
    end

    def append(data : Int32)
      node = Node.new(data)
      current = self
      while current && current.next
        current = current.next
      end
      current.next = node if current # has to be true
      end
    end
  end

  module Chapter2_1
    def self.delete_dups(node : Node)
      set = Set(Int32).new
      previous : Node = Node.new(0)   # dummy node
      while node
        if set.includes?(node.data)
          # delete node
          previous.next = node.next
        else
          set.add(node.data)
          previous = node
        end
        node = node.next
      end
    end

    def self.delete_dups_2(node : Node)
      previous = node
      current = previous.next

      while current
        runner = node
        while runner != current   # check ealier duplicates
          if runner && runner.data == current.data
            tmp = current.next
            previous.next = tmp if previous # has to be true
            current = tmp
            break
          end
          runner = runner.next if runner  # has to be true
        end
        # update the current pointer
        if current && runner == current
          previous = current
          current = current.next
        end
      end
    end
  end
end
