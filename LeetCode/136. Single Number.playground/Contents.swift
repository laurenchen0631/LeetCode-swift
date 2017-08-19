/*************************************************************************************
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity.
 Could you implement it without using extra memory?
 **************************************************************************************/

func singleNumber(_ nums: [Int]) -> Int {
    var res = nums[0]
    for i in 1 ..< nums.count {
        res ^= nums[i]
    }
    
    return res
}

singleNumber([1,2,2,3,4,4,3])