/*************************************************************************************
 Given a collection of integers that might contain duplicates, nums, return all possible subsets.
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,2], a solution is:
 
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]
 **************************************************************************************/

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var subsets: [[Int]] = [[]]
    var nonDuplicateSize = 0
    
    for i in 0 ..< nums.count {
        let fromIndex = (i > 0 && nums[i - 1] == nums[i]) ? nonDuplicateSize : 0
        nonDuplicateSize = subsets.count
    
        for j in fromIndex ..< subsets.count {
            subsets.append(subsets[j] + [nums[i]])
        }
    }
    
    return subsets
}

subsetsWithDup([1,2,2,2])