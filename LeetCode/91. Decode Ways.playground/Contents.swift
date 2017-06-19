/*************************************************************************************
 A message containing letters from A-Z is being encoded to numbers using the following mapping:
 
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given an encoded message containing digits, determine the total number of ways to decode it.
 
 For example,
 Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).
 
 The number of ways decoding "12" is 2.
 **************************************************************************************/

func numDecodings(_ s: String) -> Int {
    let length = s.characters.count
    let s = Array(s.characters)
    if length < 1 || s[0] == "0" {
        return 0
    }
    var dp: [Int] = Array(repeating: 1, count: length + 1)
    for i in 1 ..< length {
        // zero voids ways of the last because zero cannot be used separately
        if s[i] == "0" {
            dp[i] = 0
        }
        
        // possible two-digit letter, so new dp is sum of both while new r2 is the old r1
        if s[i - 1] == "1" || (s[i - 1] == "2" && s[i] <= "6") {
            dp[i+1] = dp[i-1] + dp[i]
        }
        // one-digit letter, no new way added
        else {
            dp[i+1] = dp[i]
        }
    }
    
    return dp.last!
}

print(numDecodings("101010101010101010101010101010101010101010"))