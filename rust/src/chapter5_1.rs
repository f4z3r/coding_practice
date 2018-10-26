//! You are given two 32-bit numbers, N and M, and two bit positions, i an j. Write a method to set all bits between i
//! and j in N equal to M (e.g., M becomes a substring of N located at i and starting at j).
//!
//! EXAMPLE:Input: N = 10000000000, M = 10101, i = 2, j = 6
//! Output: N = 10001010100


fn set_bits(mut bitstring: u32, mut subset: u32, i: u8, j: u8) -> u32 {
    subset <<= i;
    for idx in i..=j {
        let bit = 2_u32.pow(idx as u32);
        bitstring &= !bit;              // unset bit
        bitstring ^= subset & bit;      // set bit
    }

    bitstring
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        assert_eq!(set_bits(0b10000000000, 0b10101, 2, 6), 0b10001010100);
        assert_eq!(set_bits(0b10000001101, 0b10101, 2, 6), 0b10001010101);
    }
}
