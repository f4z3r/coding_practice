//! Write a program to sort a stack in ascending order  You should not make any assump-tions about how the stack is
//! implemented   The following are the only functions that should be used to write this program:
//! push | pop | peek | isEmpty.

fn sort_stack<T>(mut stack: Vec<T>) -> Vec<T> where T: PartialOrd {
    let mut result = Vec::<T>::new();
    while !stack.is_empty() {
        let tmp = stack.pop().unwrap();
        while !result.is_empty() && *result.last().unwrap() > tmp {
            stack.push(result.pop().unwrap());
        }
        result.push(tmp);
    }
    result
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let stack = vec![5, 3, 2, 6, 1, 8, 10, 3, 6];
        let sorted = sort_stack(stack);
        assert_eq!(sorted, vec![1, 2, 3, 3, 5, 6, 6, 8, 10]);
    }
}
