/*************************************************************************************
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
 
 For example, given the following triangle
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
 
 Note:
 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 **************************************************************************************/

func minimumTotal(_ triangle: [[Int]]) -> Int {
    var dp = triangle.last!
    for layer in stride(from: triangle.count - 2, through: 0, by: -1) {
        for i in 0 ... layer {
            dp[i] = min(dp[i], dp[i + 1]) + triangle[layer][i]
        }
    }
    return dp[0]
}

var tri = [
    [2],
    [3,4],
    [6,5,7],
    [4,1,8,3]
]

minimumTotal(tri)