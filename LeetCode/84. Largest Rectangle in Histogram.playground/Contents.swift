/*************************************************************************************
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1,
 find the area of largest rectangle in the histogram.
 
 For example,
 Given heights = [2,1,5,6,2,3],
 return 10.
 **************************************************************************************/

func largestRectangleArea(_ heights: [Int]) -> Int {
    guard heights.count > 0 else {
        return 0
    }
    let numBar = heights.count
    
//    For any bar i the maximum rectangle is of width r - l - 1 where
//    r - is the last coordinate of the bar to the right with height h[r] >= h[i]
//    l - is the last coordinate of the bar to the left which height h[l] >= h[i]
    
    var firstLeftBarLowerThanBar: [Int] = Array(repeating: -1, count: numBar)
    for i in 1 ..< numBar {
        var left = i - 1
        while left >= 0 && heights[left] >= heights[i] {
            left = firstLeftBarLowerThanBar[left]
        }
        firstLeftBarLowerThanBar[i] = left
    }
    
    var firstRightBarLowerThanBar: [Int] = Array(repeating: numBar, count: numBar)
    for i in stride(from: numBar - 2, through: 0, by: -1) {
        var right = i + 1
        while right < numBar && heights[right] >= heights[i] {
            right = firstRightBarLowerThanBar[right]
        }
        firstRightBarLowerThanBar[i] = right
    }
    
    var maxArea = 0
    for i in 0 ..< numBar {
        let width = firstRightBarLowerThanBar[i] - firstLeftBarLowerThanBar[i] - 1
        maxArea = max(maxArea, heights[i] * width)
    }
    return maxArea
}

largestRectangleArea([2,1,5,6,2,3])
