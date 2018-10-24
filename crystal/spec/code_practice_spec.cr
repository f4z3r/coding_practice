require "./spec_helper"

include CodePractice

describe CodePractice do
  it "chapter2_1 solution 1 works" do
    head = Node.new(4)
    head.append(5)
    head.append(4)
    head.append(1)
    head.append(2)
    head.append(3)
    head.append(5)
    head.append(6)
    head.append(4)


    Chapter2_1.delete_dups(head)
    if head
      head.data.should eq 4
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 5
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 1
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 2
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 3
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 6
      head = head.next
    else
      true.should be_false
    end


    true.should be_false if head
  end

  it "chapter2_1 solution 2 works" do
    head = Node.new(4)
    head.append(5)
    head.append(4)
    head.append(1)
    head.append(2)
    head.append(3)
    head.append(5)
    head.append(6)
    head.append(4)


    Chapter2_1.delete_dups_2(head)
    if head
      head.data.should eq 4
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 5
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 1
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 2
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 3
      head = head.next
    else
      true.should be_false
    end

    if head
      head.data.should eq 6
      head = head.next
    else
      true.should be_false
    end


    true.should be_false if head
  end
end
