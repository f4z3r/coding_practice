//! Implement an algorithm to determine if a string has all unique characters What if you can not use additional data
//! structures?

/// This implementation has O(n^2) running time as it must go through the string (`contains()`) for each character in
/// the string. The function takes no space as the iterator does not copy the characters. It works for UTF-8 encoded
/// strings. In practice this is not a problem, as real strings with non-repeating characters are usually relatively
/// short.
#[allow(dead_code)]
fn has_unique_chars(string: &str) -> bool {
    for (idx, ch) in string.chars().enumerate() {
        if string[idx+1..].contains(ch) {
            return false
        }
    }
    true
}

/// O(n) solution. Works only with ASCII character set. Uses extra memory to store which characters have already been
/// seen.
#[allow(dead_code)]
fn has_unique_chars2(string: &str) -> bool {
    assert!(string.is_ascii());
    let mut seen = vec![false; 256];
    for ch in string.chars() {
        let char_code = ch as usize;
        if seen[char_code] { return false }
        seen[char_code] = true;
    }
    true
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        assert!(has_unique_chars("abcdefghijk"));
        assert!(has_unique_chars("abcpkljse"));
        assert!(!has_unique_chars("abcabc"));
        assert!(!has_unique_chars("aaopffdvfdf"));
        assert!(!has_unique_chars("ploidskl"));
        assert!(has_unique_chars("qwertyuiopasdfghjklzxcvbnm,./[];'\\\""));
        assert!(!has_unique_chars("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""));

        assert!(has_unique_chars2("abcdefghijk"));
        assert!(has_unique_chars2("abcpkljse"));
        assert!(!has_unique_chars2("abcabc"));
        assert!(!has_unique_chars2("aaopffdvfdf"));
        assert!(!has_unique_chars2("ploidskl"));
        assert!(has_unique_chars2("qwertyuiopasdfghjklzxcvbnm,./[];'\\\""));
        assert!(!has_unique_chars2("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""));
    }
}
