/*************************************************************************************
 Given a m x n grid filled with non-negative numbers, 
 find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 **************************************************************************************/

func minPathSum(_ grid: [[Int]]) -> Int {
    var pathsSum: [Int] = [grid.first!.first!]
    for col in 1 ..< grid.first!.count {
        pathsSum.append(pathsSum[col - 1] + grid[0][col])
    }
    
    for row in 1 ..< grid.count {
        pathsSum[0] += grid[row][0]
        for col in 1 ..< grid.first!.count {
            pathsSum[col] = min(pathsSum[col], pathsSum[col - 1]) + grid[row][col]
        }
    }
    
    return pathsSum.last!
}

minPathSum(
[
    [1,2,3,5],
    [3,9,1,4],
    [1,4,7,1]
]
)