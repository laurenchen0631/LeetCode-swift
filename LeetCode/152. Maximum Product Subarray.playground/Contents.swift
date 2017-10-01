/*************************************************************************************
 Find the contiguous subarray within an array (containing at least one number) which has the largest product.
 
 For example, given the array [2,3,-2,4],
 the contiguous subarray [2,3] has the largest product = 6.
 **************************************************************************************/

func maxProduct(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var maximum = nums[0]
    var localMax = maximum
    var localMin = maximum
    for num in nums[1...] {
        if num < 0 {
            swap(&localMax, &localMin)
        }
        
        localMax = max(num, num * localMax)
        localMin = min(num, num * localMin)
        
        maximum = max(localMax, maximum)
    }
    
    return maximum
}

maxProduct([2,3,-6,4])
