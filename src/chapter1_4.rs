//! Write a method to decide if two strings are anagrams or not.

/// O(n) solution. Strings must be ASCII.
fn are_anagrams(string1: &str, string2: &str) -> bool {
    assert!(string1.is_ascii());
    assert!(string2.is_ascii());
    let mut char_count = vec![0i32; 128];
    for ch in string1.chars() {
        let char_code = ch as u8 as usize;
        char_count[char_code] += 1;
    }

    for ch in string2.chars() {
        let char_code = ch as u8 as usize;
        char_count[char_code] -= 1;
        // early exit of too many of this character in second string
        if char_count[char_code] < 0 {
            return false
        }
    }

    if char_count.iter().any(|&c| c != 0) {
        return false;
    }

    true
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        assert!(are_anagrams("asdfg", "gfdsa"));
        assert!(are_anagrams("ggg", "ggg"));
        assert!(are_anagrams("binary", "brainy"));
        assert!(are_anagrams("", ""));
        assert!(are_anagrams("iihhffkklltt", "ihfkltihfklt"));
        assert!(!are_anagrams("asdfgg", "gfdsa"));
        assert!(!are_anagrams("anna", "anna "));
        assert!(!are_anagrams("pottee", "eettap"));
        assert!(!are_anagrams("potter", "harry"));
    }
}
