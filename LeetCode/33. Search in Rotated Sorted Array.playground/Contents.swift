/*************************************************************************************
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 **************************************************************************************/

func search(_ nums: [Int], _ target: Int) -> Int {
    var leftBound = 0
    var rightBound = nums.count - 1
    
    // use binary search
    while leftBound <= rightBound {
        let midIndex = leftBound + (rightBound - leftBound) / 2
        let mid = nums[midIndex]
        
        if target == mid {
            return midIndex
        }
        else if target < mid {
            let left = nums[leftBound]
            
            // target will be right half when 
            // ...left half is well-ordered(target not in left) and
            // ...target is greater than the right-most one (target is out of order)
            if target < left, left <= mid {
                leftBound = midIndex + 1
            }
            else {
                rightBound = midIndex - 1
            }
        }
        // mid < target
        else {
            let right = nums[rightBound]
            if target > right, mid <= right {
                rightBound = midIndex - 1
            }
            else {
                leftBound = midIndex + 1
            }
        }
    }
    
    return -1
}


//search([4,5,6,7,8,1,2,3], 8)
//search([7,8,1,2,3,4,5,6], 8)
//search([5,6,0,1,2,3,4], 1)
//search([1,2,3], 3)
//search([6,7,1,2,3,4,5], 6)
//search([1], 0)
search([3,1], 1)

