/*************************************************************************************
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. 
 The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 How many possible unique paths are there?
 **************************************************************************************/


//Since the robot can only move right and down, when it arrives at a point, 
//there are only two possibilities:

//1. It arrives at that point from above (moving down to that point)
//2. It arrives at that point from left (moving right to that point)

//suppose the number of paths to arrive at a point (i, j) is denoted as P[i][j]
// it is easily concluded that P[i][j] = P[i - 1][j] + P[i][j - 1].
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var paths = Array(repeating: 1, count: m)
    for _ in 1 ..< n {
        for col in 1 ..< m {
            paths[col] += paths[col-1]
        }
    }
    return paths[m-1]
}

uniquePaths(3, 3)