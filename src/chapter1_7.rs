//! Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column is set to 0.

/// Flag rows and columns then clear data.
#[allow(dead_code)]
fn set_zeros(matrix: &mut Vec<Vec<i32>>) {
    // does not check that the dimensions are correct
    let rows = matrix.len();
    let cols = matrix[0].len();
    let mut row_flag = vec![false; rows];
    let mut col_flag = vec![false; cols];

    // flag rows and columns
    for i in 0..rows {
        for j in 0..cols {
            if matrix[i][j] == 0 {
                row_flag[i] = true;
                col_flag[j] = true;
            }
        }
    }

    // clear data
    for i in 0..rows {
        for j in 0..cols {
            if row_flag[i] || col_flag[j] {
                matrix[i][j] = 0;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_algo() {
        let mut matrix = vec![
            vec![1, 1, 1, 1],
            vec![1, 0, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
        ];
        let expected = vec![
            vec![1, 0, 1, 1],
            vec![0, 0, 0, 0],
            vec![1, 0, 1, 1],
            vec![1, 0, 1, 1],
            vec![1, 0, 1, 1],
            vec![1, 0, 1, 1],
        ];
        set_zeros(&mut matrix);
        assert_eq!(matrix, expected);


        let mut matrix = vec![
            vec![1, 1, 1, 1],
            vec![1, 0, 0, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 0, 1],
            vec![0, 1, 1, 1],
            vec![1, 1, 1, 1],
        ];
        let expected = vec![
            vec![0, 0, 0, 1],
            vec![0, 0, 0, 0],
            vec![0, 0, 0, 1],
            vec![0, 0, 0, 0],
            vec![0, 0, 0, 0],
            vec![0, 0, 0, 1],
        ];
        set_zeros(&mut matrix);
        assert_eq!(matrix, expected);

        let mut matrix = vec![
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
        ];
        let expected = vec![
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
            vec![1, 1, 1, 1],
        ];
        set_zeros(&mut matrix);
        assert_eq!(matrix, expected);
    }
}
