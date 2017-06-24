/*************************************************************************************
 Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
 
 For example,
 Given:
 s1 = "aabcc",
 s2 = "dbbca",
 
 When s3 = "aadbbcbcac", return true.
 When s3 = "aadbbbaccc", return false.
 **************************************************************************************/


func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    if s1 + s2 == s3 {
        return true
    }
    else if (s1.isEmpty || s2.isEmpty) && s1 + s2 != s3 {
        return false
    }
    
    let s1 = Array(s1.characters)
    let s2 = Array(s2.characters)
    let s3 = Array(s3.characters)
    
    if s1.count + s2.count != s3.count {
        return false
    }
    
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
    dp[0][0] = true
    for i in 1 ... s1.count {
        dp[i][0] = dp[i - 1][0] && s1[i - 1] == s3[i - 1]
        if !dp[i][0] {
            break
        }
    }
    for j in 1 ... s2.count {
        dp[0][j] = dp[0][j - 1] && s2[j - 1] == s3[j - 1]
        if !dp[0][j] {
            break
        }
    }
    
    for i in 1 ... s1.count {
        for j in 1 ... s2.count {
            dp[i][j] = (
                (dp[i - 1][j] && s1[i - 1] == s3[i - 1 + j]) ||
                (dp[i][j - 1] && s2[j - 1] == s3[j - 1 + i]))
        }
    }
    
    return dp.last!.last!
}

isInterleave("a", "", "c")