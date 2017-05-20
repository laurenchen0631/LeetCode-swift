/*************************************************************************************
 Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
 
 For example,
 Given n = 3,
 
 You should return the following matrix:
 [
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
 ]
 **************************************************************************************/

func generateMatrix(_ n: Int) -> [[Int]] {
    guard n > 0 else {
        return []
    }
    
    var matrix: [[Int]] = Array(
        repeating: Array(repeating: 0, count: n),
        count: n
    )
    
    func isFilled(row: Int, col: Int) -> Bool {
        return (
            row < 0 || n <= row ||
            col < 0 || n <= col ||
            matrix[row][col] != 0
        )
    }
    
    var rowIndex = 0
    var colIndex = 0
    var rowStep = 0
    var colStep = 1
    for i in 1 ... n*n {
        matrix[rowIndex][colIndex] = i
        if isFilled(row: rowIndex+rowStep, col: colIndex+colStep) {
            // rotate move direction (1, 0) -> (0, 1) -> (-1, 0) -> (0, -1) -> (1, 0) ->...
            // (rowStep, colStep) = (colStep, -rowStep)
            swap(&rowStep, &colStep)
            colStep = -colStep
        }
        rowIndex += rowStep
        colIndex += colStep
    }
    return matrix
    
}
generateMatrix(21)