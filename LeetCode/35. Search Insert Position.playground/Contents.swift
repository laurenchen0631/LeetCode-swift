/*************************************************************************************
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 **************************************************************************************/


// 1 2 5 6 7, 4
// [1 3] [6 7]

// left = 0, righ = 1
// [1 3] if target is 2 --> mid = 0, right = mid - 1 = 0 --> [1], mid = 0, 2 > 1, left = mid + 1 = 1
// [1 3], target = 0 --> [1], mid = 0, 0 < 1, right = mid - 1 = -1, left = 0
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if nums[mid] == target {
            return mid
        }
        else if target < nums[mid] {
            right = mid - 1
        }
        else {
            left = mid + 1
        }
    }
    
    return left
}

searchInsert([1], 0)