/******************************************************************
 Given an array S of n integers, find three integers in S such that 
 the sum is closest to a given number, target. 
 Return the sum of the three integers. 
 You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 ********************************************************************/

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 4 {
        return nums.reduce(0, +)
    }
    let sortedNums = nums.sorted()
    let length = nums.count
    var minError = sortedNums[0] + sortedNums[1] + sortedNums[2] - target
    
    // loop  as the way in problem 15
    for i in 0...length - 3 {
        let x = sortedNums[i]
        let complement = -x
        
        var front = i + 1
        var back = length - 1
        while front < back {
            let sum = x + sortedNums[front] + sortedNums[back]
            
            // when sum equals to target
            if sum == target {
                return sum
            }
            else if abs(sum - target) < abs(minError) {
                minError = sum - target
            }
            
            if sum < target {
                front = front + 1
            }
            else {
                back = back - 1
            }
            
        }
        
    }
    
    return target + minError
}

threeSumClosest([1,1,1,1], 0)