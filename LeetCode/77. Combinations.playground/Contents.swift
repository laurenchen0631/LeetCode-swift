/*************************************************************************************
 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
 
 For example,
 If n = 4 and k = 2, a solution is:
 
 [
 [2,4],
 [3,4],
 [2,3],
 [1,2],
 [1,3],
 [1,4],
 ]
 **************************************************************************************/

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var combinations: [[Int]] = []
    var comb: [Int] = []
    combinationImp(combinations: &combinations, comb: &comb, from: 1, n: n, k: k)
    
    return combinations
}

func combinationImp(
    combinations output: inout [[Int]],
    comb tmp: inout [Int],
    from start: Int,
    n: Int,
    k: Int
    ) {
    if tmp.count == k {
        output.append(tmp)
        return
    }
    for num in start ... n - (k - tmp.count) + 1 {
        tmp.append(num)
        combinationImp(combinations: &output, comb: &tmp, from: num+1, n: n, k: k)
        tmp.popLast()
    }
}

for comb in combine(5, 4) {
    print(comb)
}
