
/*************************************************************************************
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 **************************************************************************************/

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        if nums[left] < nums[right] {
            return nums[left]
        }
        
        let mid = (left + right) / 2
        
        if nums[mid] < nums[left] {
            right = mid
        }
        else if nums[mid] > nums[right] {
            left = mid + 1
        }
    }
    
    return nums[left]
}

findMin([4, 5, 6, 7, 0, 1, 2])
