//! Imagine a (literal) stack of plates If the stack gets too high, it might topple. Therefore, in real life, we would
//! likely start a new stack when the previous stack exceeds some threshold Implement a data structure `SetOfStacks`
//! that mimics this `SetOfStacks` should be composed of several stacks, and should create a new stack once the previous
//! one exceeds capacity. `SetOfStacks::push()` and `SetOfStacks::pop()` should behave identically to a single stack
//! (that is, `pop()` should return the same values as it would if there were just a single stack)
//!
//! FOLLOW UP
//!
//! Implement a function `popAt(int index)` which performs a pop operation on a specific sub-stack.


struct SetOfStacks<T> {
    stacks: Vec<Vec<T>>,
    capacity: usize,
}

impl<T> SetOfStacks<T> {
    pub fn new(capacity: usize) -> SetOfStacks<T> {
        SetOfStacks { stacks: Vec::new(), capacity }
    }

    pub fn push(&mut self, data: T) {
        if let Some(stack) = self.stacks.last_mut() {
            if stack.len() < self.capacity {
                stack.push(data);
                return;
            }
        }
        self.stacks.push(vec![data]);
    }

    pub fn pop(&mut self) -> Option<T> {
        loop {
            if let Some(stack) = self.stacks.last_mut() {
                if !stack.is_empty() {
                    return stack.pop();
                }
            } else {
                return None;
            }
            // empty stack at the end of the list
            self.stacks.pop();
        }
    }

    pub fn pop_at(&mut self, stack_num: usize) -> Option<T> {
        if stack_num < self.stacks.len() {
            self.stacks[stack_num].pop()
        } else {
            None
        }
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_setofstacks() {
        let mut set_of_stacks = SetOfStacks::new(2);
        set_of_stacks.push(11);
        set_of_stacks.push(12);
        set_of_stacks.push(21);
        set_of_stacks.push(22);
        set_of_stacks.push(31);
        set_of_stacks.push(32);
        set_of_stacks.push(41);
        set_of_stacks.push(42);
        assert_eq!(set_of_stacks.pop(), Some(42));
        assert_eq!(set_of_stacks.pop(), Some(41));
        assert_eq!(set_of_stacks.pop(), Some(32));
        assert_eq!(set_of_stacks.pop(), Some(31));
        assert_eq!(set_of_stacks.pop(), Some(22));
        assert_eq!(set_of_stacks.pop(), Some(21));
        assert_eq!(set_of_stacks.pop(), Some(12));
        assert_eq!(set_of_stacks.pop(), Some(11));
        assert_eq!(set_of_stacks.pop(), None);
    }

    #[test]
    fn test_pop_at() {
        let mut set_of_stacks = SetOfStacks::new(2);
        set_of_stacks.push(11);
        set_of_stacks.push(12);
        set_of_stacks.push(21);
        set_of_stacks.push(22);
        set_of_stacks.push(31);
        set_of_stacks.push(32);
        set_of_stacks.push(41);
        set_of_stacks.push(42);
        assert_eq!(set_of_stacks.pop_at(2), Some(32));
        assert_eq!(set_of_stacks.pop_at(0), Some(12));
        assert_eq!(set_of_stacks.pop_at(0), Some(11));
        assert_eq!(set_of_stacks.pop_at(0), None);
        assert_eq!(set_of_stacks.pop(), Some(42));
        assert_eq!(set_of_stacks.pop(), Some(41));
        assert_eq!(set_of_stacks.pop(), Some(31));
        assert_eq!(set_of_stacks.pop(), Some(22));
        assert_eq!(set_of_stacks.pop(), Some(21));
        assert_eq!(set_of_stacks.pop(), None);
        assert_eq!(set_of_stacks.pop_at(6), None);
    }
}
