//! How would you design a stack which, in addition to push and pop, also has a function min which returns the minimum
//! element? Push, pop and min should all operate in O(1) time.

use std;

struct MinStack {
    stack: Vec<i32>,
    mins: Vec<i32>,
}

impl MinStack {
    pub fn new() -> MinStack {
        MinStack { stack: Vec::new(), mins: Vec::new() }
    }

    pub fn push(&mut self, val: i32) {
        let min = self.get_min();
        if val <= min {
            self.mins.push(val);
        }
        self.stack.push(val);
    }

    pub fn pop(&mut self) -> Option<i32> {
        let min = self.get_min();
        let result = self.stack.pop();
        if let Some(i) = result {
            if i == min {
                self.mins.pop();
            }
        }
        result
    }

    pub fn get_min(&self) -> i32 {
        match self.mins.last() {
            Some(i) => *i,
            None    => std::i32::MAX,
        }
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let mut min_stack = MinStack::new();
        min_stack.push(32);
        min_stack.push(3);
        min_stack.push(3);
        min_stack.push(120);
        min_stack.push(4);
        min_stack.push(2);
        min_stack.push(3);

        assert_eq!(min_stack.get_min(), 2);

        let _ = min_stack.pop();
        let val = min_stack.pop();

        assert!(val.is_some());
        assert_eq!(val.unwrap(), 2);
        assert_eq!(min_stack.get_min(), 3);

        let _ = min_stack.pop();
        let _ = min_stack.pop();

        assert_eq!(min_stack.get_min(), 3);
        let _ = min_stack.pop();
        assert_eq!(min_stack.get_min(), 3);
        let _ = min_stack.pop();

        assert_eq!(min_stack.get_min(), 32);
    }
}
