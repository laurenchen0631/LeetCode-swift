/*************************************************************************************
 Given n non-negative integers representing an elevation map where the width of each bar is 1, 
 compute how much water it is able to trap after raining.
 
 For example,
 Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
 **************************************************************************************/

func trap(_ height: [Int]) -> Int {
    // Acumulate every area of containers of width 1
    // to find the minimum area we need a left bar and a right bar narrower and narrower
    // advance the side that has lower height, and record the local maximum of left and right
    // the height wihch is lower than maximum can contain the water (height[i] - local max of that side)
    
    var waterAmount = 0
    var maxLeftHeight = 0
    var maxRightHeight = 0
    var leftBound = 0
    var rightBound = height.count - 1
    
    while leftBound < rightBound {
        let leftBarHeight = height[leftBound]
        let rightBarHeight = height[rightBound]
        
        if leftBarHeight <= rightBarHeight {
            if leftBarHeight > maxLeftHeight {
                maxLeftHeight = leftBarHeight
            }
            waterAmount += (maxLeftHeight - leftBarHeight)
            leftBound += 1
        }
        else {
            if rightBarHeight > maxRightHeight {
                maxRightHeight = rightBarHeight
            }
            waterAmount += (maxRightHeight - rightBarHeight)
            rightBound -= 1
        }
    }
    
    return waterAmount
}

trap([0,1,0,2,1,0,1,3,2,1,2,1])