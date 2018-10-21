//! Design an algorithm and write code to remove the duplicate characters in a string without using any additional
//! buffer
//!
//! NOTE: One or two additional variables are fine An extra copy of the array is not
//!
//! FOLLOW UP
//! Write the test cases for this method

/// solution provided in book for O(n^2) not possible in rust as strings are not indexable since they are UTF-8 encoded.
/// This solution is O(n). Requires ASCII strings.
fn remove_dup_chars(string: &mut String) {
    assert!(string.is_ascii());
    let mut seen = vec![false; 128];
    string.retain(|c| {
        let char_code = c as u8 as usize;
        if seen[char_code] {
            false
        } else {
            seen[char_code] = true;
            true
        }
    });
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let mut string = String::from("aaaaaaa");
        remove_dup_chars(&mut string);
        assert_eq!(string, "a");

        string = String::from("abcd");
        remove_dup_chars(&mut string);
        assert_eq!(string, "abcd");

        string = String::from("");
        remove_dup_chars(&mut string);
        assert_eq!(string, "");

        string = String::from("ababababa");
        remove_dup_chars(&mut string);
        assert_eq!(string, "ab");

        string = String::from("aaabbbb");
        remove_dup_chars(&mut string);
        assert_eq!(string, "ab");
    }
}

