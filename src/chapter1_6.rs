//! Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the
//! image by 90 degrees. Can you do this in place?

/// Iterate through a fourth of the image and rotate by exchanging the 4 pixels that will be rotated.
#[allow(dead_code)]
fn rotate(image: &mut Vec<Vec<u32>>) {
    // dimension checking ommited
    let length = image.len();
    let half_length = (length + 1) / 2;
    let mut inner_length = half_length;
    if length % 2 == 1 {
        inner_length -= 1;
    }
    for i in 0..half_length {
        for j in 0..inner_length {
            let temp = image[i][j];
            image[i][j] = image[length - j - 1][i];
            image[length - j - 1][i] = image[length - i - 1][length - j - 1];
            image[length - i - 1][length - j - 1] = image[j][length - i - 1];
            image[j][length - i - 1] = temp;
        }
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let mut matrix = vec![
            vec![1, 2, 3, 4],
            vec![5, 6, 7, 8],
            vec![9, 10, 11, 12],
            vec![13, 14, 15, 16],
        ];
        let expected = vec![
            vec![13, 9, 5, 1],
            vec![14, 10, 6, 2],
            vec![15, 11, 7, 3],
            vec![16, 12, 8, 4],
        ];
        rotate(&mut matrix);
        assert_eq!(matrix, expected);

        let mut matrix = vec![
            vec![1],
        ];
        let expected = vec![
            vec![1],
        ];
        rotate(&mut matrix);
        assert_eq!(matrix, expected);

        let mut matrix = vec![
            vec![1, 2, 3],
            vec![4, 5, 6],
            vec![7, 8, 9],
        ];
        let expected = vec![
            vec![7, 4, 1],
            vec![8, 5, 2],
            vec![9, 6, 3],
        ];
        rotate(&mut matrix);
        assert_eq!(matrix, expected);

        let mut matrix = vec![
            vec![1, 2, 2, 2, 1],
            vec![1, 2, 2, 2, 1],
            vec![1, 2, 2, 2, 1],
            vec![1, 2, 2, 2, 1],
            vec![1, 2, 2, 2, 1],
        ];
        let expected = vec![
            vec![1, 1, 1, 1, 1],
            vec![2, 2, 2, 2, 2],
            vec![2, 2, 2, 2, 2],
            vec![2, 2, 2, 2, 2],
            vec![1, 1, 1, 1, 1],
        ];
        rotate(&mut matrix);
        assert_eq!(matrix, expected);
    }
}
