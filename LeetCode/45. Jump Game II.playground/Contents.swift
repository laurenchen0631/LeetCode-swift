/*************************************************************************************
 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Your goal is to reach the last index in the minimum number of jumps.
 
 For example:
 Given array A = [2,3,1,1,4]
 
 The minimum number of jumps to reach the last index is 2. (Jump 1 step from index 0 to 1, then 3 steps to the last index.)
 
 Note:
 You can assume that you can always reach the last index.
 **************************************************************************************/

// index:  0  1  2  3  4
//  nums: [2, 3, 1, 1, 4]
// canGo:  2  4  3  4  8
// we always choose the furthest index that we can go in the one step
func jump(_ nums: [Int]) -> Int {
    var furthestIndexCanGo = 0
    var steps = 0
    var jumpLimitForNow = 0
    for i in 0 ..< nums.count - 1 {
        let indexCanGo = nums[i] + i
        if furthestIndexCanGo < indexCanGo {
            furthestIndexCanGo = indexCanGo
        }
        
        if i == jumpLimitForNow  {
            steps += 1
            jumpLimitForNow = furthestIndexCanGo
            if nums.count - 1 <= jumpLimitForNow {
                break
            }
        }
    }
    
    return steps
}

jump([2,3,1,1,4])