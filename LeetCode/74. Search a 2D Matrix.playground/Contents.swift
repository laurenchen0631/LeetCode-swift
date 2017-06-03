/*************************************************************************************
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 For example,
 
 Consider the following matrix:
 
 [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 Given target = 3, return true.
 **************************************************************************************/

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.count > 0, matrix.first!.count > 0 else {
        return false
    }
    
    var lo = 0
    var hi = matrix.count * matrix.first!.count - 1
    while lo <= hi {
        let mid = (lo + hi) / 2
        let row = mid / matrix.first!.count
        let col = mid % matrix.first!.count
        
        if matrix[row][col] == target {
            return true
        }
        else if target < matrix[row][col] {
            hi = mid - 1
        }
        else {
            lo = mid + 1
        }
    }
    return false
}

var m = [
    [1,   3,  5,  7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
]
searchMatrix(m, 3)