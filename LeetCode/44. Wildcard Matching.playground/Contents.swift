/*************************************************************************************
 Implement wildcard pattern matching with support for '?' and '*'.
 
 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 
 The matching should cover the entire input string (not partial).
 
 The function prototype should be:
 bool isMatch(const char *s, const char *p)
 
 Some examples:
 isMatch("aa","a") → false
 isMatch("aa","aa") → true
 isMatch("aaa","aa") → false
 isMatch("aa", "*") → true
 isMatch("aa", "a*") → true
 isMatch("ab", "?*") → true
 isMatch("aab", "c*a*b") → false
 **************************************************************************************/

func isMatch(_ s: String, _ p: String) -> Bool {
    var sIndex = s.startIndex
    let S_END_INDEX = s.endIndex
    var pIndex = p.startIndex
    let P_END_INDEX = p.endIndex
    var sStarIndex: String.Index? = nil
    var pStarIndex: String.Index? = nil
    var starMatchNum = 0
    
    while sIndex < S_END_INDEX {
        // advancing both index when (both characters match) or ('?' found in pattern)
        if pIndex < P_END_INDEX && ( p[pIndex] == s[sIndex] || p[pIndex] == "?") {
            sIndex = s.index(after: sIndex)
            pIndex = p.index(after: pIndex)
        }
        
        // * found in pattern, track index of *, only advancing pattern index
        else if pIndex < P_END_INDEX, p[pIndex] == "*" {
            sStarIndex = sIndex
            pStarIndex = pIndex
            starMatchNum = 0
            pIndex = p.index(after: pIndex)
        }
            
        // current characters didn't match, and pattern has * early, current pattern is not *
        // restore pattern index to the next pattern of that '*'
        // and that '*' match one more character, then try agagin
        else if sStarIndex != nil {
            starMatchNum += 1
            sIndex = s.index(sStarIndex!, offsetBy: starMatchNum)
            pIndex = p.index(after: pStarIndex!)
        }
        
        // current pattern is not star, last pattern was not *
        // characters do not match
        else {
            return false
        }
    }
    
    // check for remaining characters in pattern
    // special case for empty string
    // otherwise, test pIndex == P_END_INDEX
    while pIndex < P_END_INDEX {
        if p[pIndex] != "*" {
            return false
        }
        pIndex = p.index(after: pIndex)
    }

    return true
}

isMatch("", "*")
