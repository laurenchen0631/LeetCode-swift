/*************************************************************************************
 Given a string S and a string T, count the number of distinct subsequences of S which equals T.
 
 A subsequence of a string is a new string which is formed from the original string 
 by deleting some (can be none) of the characters without disturbing 
 the relative positions of the remaining characters. (ie, "ACE" is a subsequence of "ABCDE" while "AEC" is not).
 
 Here is an example:
 S = "rabbbit", T = "rabbit"
 
 Return 3.

 **************************************************************************************/

// define dp[i][j] to be the number of distinct subsequences of t[0..i - 1] in s[0..j - 1].
// Then we have the following state equations:
//      case 1: dp[i][j] = dp[i][j - 1] if t[i - 1] != s[j - 1];
//      case 2: dp[i][j] = dp[i][j - 1] + dp[i - 1][j - 1] if t[i - 1] == s[j - 1];
func numDistinct(_ s: String, _ t: String) -> Int {
    let s = Array(s.characters)
    let t = Array(t.characters)
    var dp = Array(repeating: Array(repeating: 0, count: s.count + 1), count: t.count + 1)
    
    for j in 0 ..< s.count + 1 {
        dp[0][j] = 1
    }
    
    for i in 1 ..< t.count + 1 {
        for j in 1 ..< s.count + 1 {
            if s[j - 1] == t[i - 1] {
                dp[i][j] = dp[i][j - 1] + dp[i - 1][j - 1]
            }
            else {
                dp[i][j] = dp[i][j - 1]
            }
        }
    }
    
    return dp.last!.last!
}

numDistinct("rabbbit", "rabbit")