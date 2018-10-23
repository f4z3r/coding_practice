// Implement an algorithm to determine if a string has all unique characters What if you can not use additional data
// structures?

// O(n2) solution requiring no other data structures.
var has_unique_chars = function (string) {
    for(var i = 0; i < string.length; i++) {
        for(var j = i + 1; j < string.length; j++) {
            if(string[i] === string[j]) {
                return false;
            }
        }
    }
    return true;
}


// O(n) solution using an array
var has_unique_chars_ascii = function(string) {
    var chars = new Array(128).fill(false);
    for(var i = 0; i < string.length; i++) {
        var char_code = string.charCodeAt(i);
        if(chars[char_code]) {
            return false;
        }
        chars[char_code] = true;
    }
    return true;
}


module.exports = {
    "has_unique_chars": has_unique_chars,
    "has_unique_chars_ascii": has_unique_chars_ascii
}
