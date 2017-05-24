/*************************************************************************************
 Follow up for "Unique Paths":
 
 Now consider if some obstacles are added to the grids. How many unique paths would there be?
 
 An obstacle and empty space is marked as 1 and 0 respectively in the grid.
 
 For example,
 There is one obstacle in the middle of a 3x3 grid as illustrated below.
 
 [
 [0,0,0],
 [0,1,0],
 [0,0,0]
 ]
 The total number of unique paths is 2.
 
 Note: m and n will be at most 100.
 **************************************************************************************/

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    var paths: [Int] = Array(repeating: 0, count: obstacleGrid.first!.count)
    paths[0] = 1 - obstacleGrid[0][0]
    for row in 0 ..< obstacleGrid.count {
        for col in 0 ..< obstacleGrid.first!.count {
            if obstacleGrid[row][col] == 1 {
                paths[col] = 0
            }
            else if col > 0 {
                paths[col] += paths[col - 1]
            }
        }
    }
    return paths.last!
}

var obstacles = [
    [0,0,1,0,0],
    [1,0,0,0,0],
    [0,0,0,0,0],
]
uniquePathsWithObstacles(obstacles)