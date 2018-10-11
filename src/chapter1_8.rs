//! Assume you have a method isSubstring which checks if one word is a substring of another Given two strings, s1 and
//! s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring (i e , “waterbottle” is a
//! rotation of “erbottlewat”).


/// solution presented in book
#[allow(dead_code)]
fn is_rotation(str1: &str, str2: &str) -> bool {
    if str1.len() != str2.len() {
        return false
    }
    let mut joined = String::from(str2);
    joined.push_str(str2);
    joined.contains(str1)       // single call to the substring method
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        assert!(is_rotation("hello", "elloh"));
        assert!(!is_rotation("hello", "elloj"));
        assert!(is_rotation("apple", "pleap"));
        assert!(!is_rotation("apple", "paple"));
        assert!(!is_rotation("v", "elloh"));
        assert!(is_rotation("abababab", "babababa"));
    }
}
