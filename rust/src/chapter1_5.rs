//! Write a method to replace all spaces in a string with '%20'


/// O(n) time complexity
fn replace_spaces(string: &mut String) {
    let original = string.clone();
    *string = String::new();
    let mut last_end = 0;
    for (start, part) in original.match_indices(" ") {
        string.push_str(unsafe { original.get_unchecked(last_end..start) });
        string.push_str("%20");
        last_end = start + part.len();      // could substitute part.len() by 1 but this is more generic.
    }
    string.push_str(unsafe { original.get_unchecked(last_end..original.len()) });
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let mut string = String::from("hello world!");
        replace_spaces(&mut string);
        assert_eq!(string, "hello%20world!");

        string = String::from("    ");
        replace_spaces(&mut string);
        assert_eq!(string, "%20%20%20%20");

        string = String::from("hello world! ");
        replace_spaces(&mut string);
        assert_eq!(string, "hello%20world!%20");

        string = String::from("helloworld!");
        replace_spaces(&mut string);
        assert_eq!(string, "helloworld!");

        string = String::from("  hello world!");
        replace_spaces(&mut string);
        assert_eq!(string, "%20%20hello%20world!");
    }
}
