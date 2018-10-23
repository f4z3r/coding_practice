const chapter01_1 = require('./chapter01_1.js');

test('has_unique_chars works', () => {
    expect(chapter01_1.has_unique_chars("abcdefghijk")).toBe(true);
    expect(chapter01_1.has_unique_chars("abcpkljse")).toBe(true);
    expect(chapter01_1.has_unique_chars("abcabc")).toBe(false);
    expect(chapter01_1.has_unique_chars("aaopffdvfdf")).toBe(false);
    expect(chapter01_1.has_unique_chars("ploidskl")).toBe(false);
    expect(chapter01_1.has_unique_chars("qwertyuiopasdfghjklzxcvbnm,./[];'\\\"")).toBe(true);
    expect(chapter01_1.has_unique_chars("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\"")).toBe(false);
});

test('has_unique_chars_ascii works', () => {
    expect(chapter01_1.has_unique_chars_ascii("abcdefghijk")).toBe(true);
    expect(chapter01_1.has_unique_chars_ascii("abcpkljse")).toBe(true);
    expect(chapter01_1.has_unique_chars_ascii("abcabc")).toBe(false);
    expect(chapter01_1.has_unique_chars_ascii("aaopffdvfdf")).toBe(false);
    expect(chapter01_1.has_unique_chars_ascii("ploidskl")).toBe(false);
    expect(chapter01_1.has_unique_chars_ascii("qwertyuiopasdfghjklzxcvbnm,./[];'\\\"")).toBe(true);
    expect(chapter01_1.has_unique_chars_ascii("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\"")).toBe(false);
});
