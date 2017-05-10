/*************************************************************************************
 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 
 Follow up:
 Could you do this in-place?
 **************************************************************************************/

/*
 * clockwise rotate
 * swap the symmetry, then swap horizontally
 * 1 2 3     1 4 7     7 4 1
 * 4 5 6  => 2 5 8  => 8 5 2
 * 7 8 9     3 6 9     9 6 3
 */
func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for row in 0 ..< n - 1 {
        for col in row + 1 ..< n {
            swap(&matrix[row][col], &matrix[col][row])
        }
    }
    
    for row in 0 ..< n {
        for col in 0 ..< n/2 {
            swap(&matrix[row][col], &matrix[row][n - 1 - col])
        }
    }
}

var matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
rotate(&matrix)