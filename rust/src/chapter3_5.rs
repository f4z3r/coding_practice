//! Implement a MyQueue class which implements a queue using two stacks.


struct MyQueue<T> {
    stack1: Vec<T>,
    stack2: Vec<T>,
}

impl<T> MyQueue<T> {
    pub fn new() -> MyQueue<T> {
        MyQueue { stack1: Vec::new(), stack2: Vec::new() }
    }

    pub fn add(&mut self, value: T) {
        self.stack1.push(value);
    }

    pub fn remove(&mut self) -> Option<T> {
        if !self.stack2.is_empty() { return self.stack2.pop() }
        while !self.stack1.is_empty() {
            self.stack2.push(self.stack1.pop().unwrap());
        }
        self.stack2.pop()
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_queue() {
        let mut queue = MyQueue::new();
        queue.add(1);
        queue.add(2);
        queue.add(3);
        queue.add(4);
        assert_eq!(queue.remove(), Some(1));
        queue.add(5);
        queue.add(6);
        queue.add(7);
        assert_eq!(queue.remove(), Some(2));
        assert_eq!(queue.remove(), Some(3));
        assert_eq!(queue.remove(), Some(4));
        assert_eq!(queue.remove(), Some(5));
        assert_eq!(queue.remove(), Some(6));
        assert_eq!(queue.remove(), Some(7));
        assert_eq!(queue.remove(), None);
    }
}
