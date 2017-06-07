/*************************************************************************************
 Given a set of distinct integers, nums, return all possible subsets.
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,3], a solution is:
 
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 **************************************************************************************/

func subsets(_ nums: [Int]) -> [[Int]] {
    var subset: [[Int]] = [[]]
    for num in nums {
        for set in subset {
            subset.append(set + [num])
        }
    }
    return subset
}

func subsets2(_ nums: [Int]) -> [[Int]] {
    let subsetCount = 1 << nums.count
    var result: [[Int]] = Array(repeating: [], count: subsetCount)
    
    for i in 0 ..< subsetCount {
        for j in 0 ..< nums.count {
            if ( i & (1 << j)) != 0 {
                result[i].append(nums[j])
            }
        }
    }
    return result
}

subsets([3,2,1])
subsets2([1,2,3])