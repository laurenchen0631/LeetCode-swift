/******************************************************************
Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai).
n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.
********************************************************************/

func maxArea(_ height: [Int]) -> Int {
	
	var maxArea = 0
	// calculate the area between the line on left bound and right bound,
	var leftBound = 0
	var rightBound = height.count - 1
	while leftBound != rightBound {
		let leftHeight = height[leftBound]
		let rightHeight = height[rightBound]
		
		// if the area is larger than the previous, save it as the result
		let area = min(leftHeight, rightHeight) * (rightBound - leftBound)
		if area > maxArea {
			maxArea = area
		}
		
		// if the heihgt of left bound is lower than the right one, 
		// try next left bound and vice versa.
		if (leftHeight < rightHeight) {
			leftBound += 1
		}
		else {
			rightBound -= 1
		}
	}
	
	// return the max area
	return maxArea
}

print(maxArea([3, 4, 1,7,8,2]))