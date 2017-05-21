/*************************************************************************************
 The set [1,2,3,…,n] contains a total of n! unique permutations.
 
 By listing and labeling all of the permutations in order,
 We get the following sequence (ie, for n = 3):
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 Given n and k, return the kth permutation sequence.
 
 Note: Given n will be between 1 and 9 inclusive.
 **************************************************************************************/


func getPermutation(_ n: Int, _ k: Int) -> String {
    let numGroupMember = factorial(n: n)
    var result = ""
    
    guard 1 <= k, k <= numGroupMember else {
        return ""
    }
    permute(
        members: Array(1...n),
        numGroupMember: numGroupMember / n,
        k: k - 1,
        output: &result
    )
    
    return result
}

func permute(members nums: [Int], numGroupMember: Int, k: Int, output: inout String) {
    var nums = nums
    let member = nums.remove(at: k / numGroupMember)
    output.append(String(member))
    
    if nums.count == 0 {
        return
    }
    permute(
        members: nums,
        numGroupMember: numGroupMember / nums.count,
        k: k % numGroupMember,
        output: &output
    )
}

func factorial(n: Int) -> Int {
    var result = 1
    for i in 1 ... n {
        result *= i
    }
    return result
}

getPermutation(5, 7)
