/*************************************************************************************
 Given two words word1 and word2, find the minimum number of steps 
 required to convert word1 to word2. (each operation is counted as 1 step.)
 
 You have the following 3 operations permitted on a word:
 
 a) Insert a character
 b) Delete a character
 c) Replace a character
 **************************************************************************************/

func minDistance(_ word1: String, _ word2: String) -> Int {
    
    let word1 = Array(word1.characters)
    let word2 = Array(word2.characters)
    
    if word1.count == 0 {
        return word2.count
    }
    else if word2.count == 0 {
        return word1.count
    }
    
    // dp[i][j] to be the minimum number of operations to convert word1[0..i - 1] to word2[0..j - 1]
    var dp: [Int] = []
    // For the boundary case, that is, to convert a string to an empty string
    // mininum number of operations to convert word2[0..j - 1] to "" requires at least j operations (deletions)
    for j in 0 ... word2.count {
        dp.append(j)
    }
    
    for i in 1 ... word1.count {
        var prev = i - 1 // prev is a tmp for dp[i-1][j-1]
        dp[0] = i
        for j in 1 ... word2.count {
            let tmpPrev = dp[j]
            
            // If they are euqal, then no more operation is needed and dp[i][j] = dp[i - 1][j - 1]
            if word1[i-1] == word2[j-1] {
                dp[j] = prev
            }
            // If they are not equal, there are 3 cases:
            // 1. Replace (dp[i][j] = dp[i - 1][j - 1] + 1);
            // 2. Delete word1[i - 1] (dp[i][j] = dp[i - 1][j] + 1);
            // 3. Insert word2[j - 1] to word1[0..i - 1] (dp[i][j] = dp[i][j - 1] + 1).
            else {
                dp[j] = min(dp[j-1] + 1, dp[j] + 1, prev + 1)
            }
            prev = tmpPrev
        }
    }
    
    return dp.last!
}

minDistance("unable", "able")