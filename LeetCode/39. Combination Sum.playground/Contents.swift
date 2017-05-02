/*************************************************************************************
 Given a set of candidate numbers (C) (without duplicates) and a target number (T), 
 find all unique combinations in C where the candidate numbers sums to T.
 
 The same repeated number may be chosen from C unlimited number of times.
 
 Note:
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 For example, given candidate set [2, 3, 6, 7] and target 7,
 A solution set is:
 [
 [7],
 [2, 2, 3]
 ]
 **************************************************************************************/

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var results: [[Int]] = []
    var combination: [Int] = []
    findCombination(candidates: candidates.sorted(), target: target, combination: &combination, output: &results)
    
    return results
}

func findCombination(
    candidates nums: [Int],
    target complement: Int,
    combination: inout [Int],
    output result: inout [[Int]]
) {
    if complement == 0 {
        result.append(combination)
        return
    }
    
    var nextNums = nums
    for num in nums {
        if num <= complement {
            combination.append(num)
            findCombination(
                candidates: nextNums,
                target: complement - num,
                combination: &combination,
                output: &result
            )
            combination.popLast()
        }
        else {
            return
        }
        nextNums.removeFirst()
    }
}

print(combinationSum([1,2,3,6,7], 7))