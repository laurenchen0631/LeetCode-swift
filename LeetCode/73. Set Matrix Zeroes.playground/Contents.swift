/*************************************************************************************
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. 
 Do it in place.
 **************************************************************************************/

func setZeroes(_ matrix: inout [[Int]]) {
    guard matrix.count > 0, matrix.first!.count > 0 else {
        return
    }
    
    var col0isZero = false
    // check whether the matrix[i][j] is 0 or not
    // if 0 is checked, set the first element of row i and column j a flag 0
    // but we skip column 0 to fix matrix[0][0] is 0 iff row 0 has a 0
    for i in 0 ..< matrix.count {
        if matrix[i][0] == 0 {
            col0isZero = true
        }
        for j in 1 ..< matrix.first!.count {
            if matrix[i][j] == 0 {
                matrix[0][j] = 0
                matrix[i][0] = 0
            }
        }
    }
    
    // we set matrix[i][j] to 0 iff the flag is 0
    // to prevent from modifing the flag, we use reversed order
    for i in stride(from: matrix.count - 1, through: 0, by: -1) {
        for j in stride(from: matrix.first!.count - 1, to: 0, by: -1) {
            if matrix[i][0] == 0 || matrix[0][j] == 0 {
                matrix[i][j] = 0
            }
        }
        if col0isZero {
            matrix[i][0] = 0
        }
    }
    
}

var matrix = [
    [1,1,0],
    [1,1,2]
]

setZeroes(&matrix)

for row in matrix {
    print(row)
}