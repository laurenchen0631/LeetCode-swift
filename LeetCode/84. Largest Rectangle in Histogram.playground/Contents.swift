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
    
    var lastLeftBarHigherThanBar: [Int] = Array(repeating: -1, count: numBar)
    for i in 1 ..< numBar {
        var p = i - 1
        while p >= 0 && heights[p] >= heights[i] {
            p = lastLeftBarHigherThanBar[p]
        }
        lastLeftBarHigherThanBar[i] = p
    }
    
    var lastRightBarHigherThanBar: [Int] = Array(repeating: numBar, count: numBar)
    for i in stride(from: numBar - 2, through: 0, by: -1) {
        var p = i + 1
        while p < numBar && heights[p] >= heights[i] {
            p = lastRightBarHigherThanBar[p]
        }
        lastRightBarHigherThanBar[i] = p
    }
    
    var maxArea = 0
    for i in 0 ..< numBar {
        let width = lastRightBarHigherThanBar[i] - lastLeftBarHigherThanBar[i] - 1
        maxArea = max(maxArea, heights[i] * width)
    }
    return maxArea
}

largestRectangleArea([2,1,5,6,2,3])