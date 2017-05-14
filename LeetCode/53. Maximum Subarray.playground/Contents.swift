/*************************************************************************************
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 **************************************************************************************/

// assume array: ..... a ... b c ... 
// sum of a ... b has benn negative
// c must be greater than sum of a ... c
func maxSubArray(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    
    var max = nums[0]
    var sum = 0
    for num in nums {
        if sum < 0 {
            sum = num
        }
        else {
            sum += num
        }
        
        if sum > max {
            max = sum
        }
    }
    
    return max
}

maxSubArray([-5,-4,-3,-2,-1])