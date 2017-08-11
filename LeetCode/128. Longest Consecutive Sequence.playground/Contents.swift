/*************************************************************************************
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 
 For example,
 Given [100, 4, 200, 1, 3, 2],
 The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
 
 Your algorithm should run in O(n) complexity.
 **************************************************************************************/

func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    let nums = Set(nums)
    var max_sequence_length = 1
    
    for num in nums {
        // skip unnecessary compare
        if nums.contains(num - 1) {
            continue
        }
        
        var next = num + 1
        while nums.contains(next) {
            next += 1
        }
        
        max_sequence_length = max(max_sequence_length, next - num)
    }
    
    return max_sequence_length
}

longestConsecutive([2147483646, -2147483647, 0, 2, 2147483644, -2147483645, 2147483645])