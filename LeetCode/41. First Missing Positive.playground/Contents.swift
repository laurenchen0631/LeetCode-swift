/*************************************************************************************
 Given an unsorted integer array, find the first missing positive integer.
 
 For example,
 Given [1,2,0] return 3,
 and [3,4,-1,1] return 2.
 
 Your algorithm should run in O(n) time and uses constant space.
 **************************************************************************************/

func firstMissingPositive(_ nums: [Int]) -> Int {
    let length = nums.count
    var sortedNums = nums
    
    // e.g [3,2,7,-5,9,-2,10,1], which is size = 8
    // size = 8 means it can present only value 1 to 8 fully,
    // so the first missing positive integer must be 1,2,3,4,...,8 or 9
    
    // move the positive integer with in representable range to its slot
    for i in 0 ..< length {
        
        var currentNum = sortedNums[i]
        while 1 <= currentNum, currentNum <= length,  sortedNums[currentNum - 1] != currentNum {
            let tmp = sortedNums[currentNum - 1]
            sortedNums[currentNum - 1] = sortedNums[i]
            sortedNums[i] = tmp
            currentNum = tmp
        }
    }
    
    for (index, num) in sortedNums.enumerated() {
        if num != index + 1 {
            return index + 1
        }
    }
    
    return length + 1
}

firstMissingPositive([3,4,-1,1])
