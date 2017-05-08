/*************************************************************************************
 Given a collection of candidate numbers (C) and a target number (T), 
 find all unique combinations in C where the candidate numbers sums to T.
 
 Each number in C may only be used once in the combination.
 
 Note:
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8,
 A solution set is:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]

 **************************************************************************************/

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
    var prevNum = -1
    for num in nums {
        nextNums.removeFirst()
        
        if num == prevNum {
            continue
        }
        if num <= complement {
            combination.append(num)
            findCombination(
                candidates: nextNums,
                target: complement - num,
                combination: &combination,
                output: &result
            )
            prevNum = num
            combination.popLast()
        }
        else {
            return
        }
    }
}

print(combinationSum2([10, 1, 2, 7, 6, 1, 5], 8))
