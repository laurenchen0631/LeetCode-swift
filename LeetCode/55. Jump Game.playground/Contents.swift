/*************************************************************************************
 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Determine if you are able to reach the last index.
 
 For example:
 A = [2,3,1,1,4], return true.
 
 A = [3,2,1,0,4], return false.
 **************************************************************************************/

func canJump(_ nums: [Int]) -> Bool {
    var canGoTo = 0
    for (i, jump) in nums.enumerated() {
        if canGoTo < i {
            return false
        }
        let toIndex = i + jump
        if nums.count - 1 <= toIndex {
            return true
        }
        else if canGoTo < toIndex {
            canGoTo = toIndex
        }
    }
    
    return true
}

canJump([3,2,1,1,4])