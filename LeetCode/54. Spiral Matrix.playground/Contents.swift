/*************************************************************************************
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 For example,
 Given the following matrix:
 
 [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
 ]
 You should return [1,2,3,6,9,8,7,4,5].
 **************************************************************************************/

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count > 0, matrix[0].count > 0 else {
        return []
    }
    
    var top = 0
    var bottom = matrix.count - 1
    var left = 0
    var right = matrix[0].count - 1
    var spiral: [Int] = []
    
    while true {
        // left to right
        for col in left...right {
            spiral.append(matrix[top][col])
        }
        top += 1
        if bottom < top { break }
        
        // up to down
        for row in top...bottom {
            spiral.append(matrix[row][right])
        }
        right -= 1
        if right < left { break }
        
        // right to left
        for col in stride(from: right, through: left, by: -1) {
            spiral.append(matrix[bottom][col])
        }
        bottom -= 1
        if bottom < top { break }

        // down to up
        for row in stride(from: bottom, through: top, by: -1) {
            spiral.append(matrix[row][left])
        }
        left += 1
        if right < left { break }
    }
    
    return spiral
}

var mat = [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
]

spiralOrder(mat)
