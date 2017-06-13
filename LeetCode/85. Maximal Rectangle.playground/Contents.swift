/*************************************************************************************
 Given a 2D binary matrix filled with 0's and 1's, 
 find the largest rectangle containing only 1's and return its area.
 
 For example, given the following matrix:
 
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 Return 6.
 **************************************************************************************/

// It can be regarded as a DP solution. The transition equations are:
// 1. left(i,j) = max(left(i-1,j), cur_left), cur_left can be determined from the current row
// 2. right(i,j) = min(right(i-1,j), cur_right), cur_right can be determined from the current row
// 3. height(i,j) = height(i-1,j) + 1, if matrix[i][j]=='1';
// 4. height(i,j) = 0, if matrix[i][j]=='0'

func maximalRectangle(_ matrix: [[Character]]) -> Int {
    guard matrix.count > 0, matrix.first!.count > 0 else {
        return 0
    }
    var height = Array(repeating: 0, count: matrix.first!.count)
    var left = Array(repeating: -1, count: matrix.first!.count)
    var right = Array(repeating: matrix.first!.count, count: matrix.first!.count)
    var maxArea = 0
    
    for i in 0 ..< matrix.count {
        var curLeft = -1
        var curRight = matrix.first!.count
        
        //compute height
        for j in 0 ..< matrix.first!.count {
            if matrix[i][j] == "0" {
                height[j] = 0
            }
            else {
                height[j] += 1
            }
        }
        
        // compute left
        for j in 0 ..< matrix.first!.count {
            if  matrix[i][j] == "0" {
                left[j] = -1
                curLeft = j
            }
            else {
                left[j] = max(left[j], curLeft)
            }
        }
        
        // compute right
        for j in stride(from: matrix.first!.count - 1, through: 0, by: -1) {
            if  matrix[i][j] == "0" {
                right[j] = matrix.first!.count
                curRight = j
            }
            else {
                right[j] = min(right[j], curRight)
            }
        }
        
        for j in 0 ..< matrix.first!.count {
            maxArea = max(maxArea, (right[j] - left[j] - 1) * height[j])
        }

    }
    return maxArea
}

var m: [[Character]] = [
    ["1", "0", "1", "0", "0"],
    ["1", "0", "1", "0", "0"],
]

maximalRectangle(m)