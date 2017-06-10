/*************************************************************************************
 Follow up for "Search in Rotated Sorted Array":
 What if duplicates are allowed?
 
 Would this affect the run-time complexity? How and why?Ø
 **************************************************************************************/

func search(_ nums: [Int], _ target: Int) -> Bool {
    var lo = 0
    var hi = nums.count - 1
    
    while lo <= hi {
        let mid = (hi + lo) / 2
        
        if nums[mid] == target {
            return true
        }
        
        //If we know for sure right side is sorted or left side is unsorted
        if nums[mid] < nums[hi] || nums[lo] > nums[mid] {
            if target > nums[mid], target <= nums[hi] {
                lo = mid + 1
            }
            else {
                hi = mid - 1
            }
        }
        
        //If we know for sure left side is sorted or right side is unsorted
        else if nums[lo] < nums[mid] || nums[mid] > nums[hi] {
            if target < nums[mid], target >= nums[lo] {
                hi = mid - 1
            }
            else {
                lo = mid + 1
            }
            
        }
        
        //If we get here, that means nums[start] == nums[mid] == nums[end], then shifting out
        //any of the two sides won't change the result but can help remove duplicate from
        //consideration, here we just use end-- but left++ works too
        else {
            hi -= 1
        }
    }
    
    return false
}

search([1,1,3,1], 3)
//search([5,5,5,4,5,5,5], 5)
