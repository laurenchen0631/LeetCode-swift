/*************************************************************************************
 Given n, how many structurally unique BST's (binary search trees) that store values 1...n?
 
 For example,
 Given n = 3, there are a total of 5 unique BST's.
 
     1         3     3      2      1
      \       /     /      / \      \
       3     2     1      1   3      2
      /     /       \                 \
     2     1         2                 3
 **************************************************************************************/

func numTrees(_ n: Int) -> Int {
    if n < 2 {
        return 1
    }
    
    // to build a tree, we need to pick a root node, then we need to know how many possible left sub trees and right sub trees 
    // ... can be held under that node, finally multiply them.
    var dp: [Int] = Array(repeating: 0, count: n+1)
    dp[0] = 1
    dp[1] = 1
    for i in 2 ... n {
        for root in 1 ... i {
            dp[i] += (dp[root - 1] * dp[i - root])
        }
    }
    return dp[n]
}

numTrees(4)