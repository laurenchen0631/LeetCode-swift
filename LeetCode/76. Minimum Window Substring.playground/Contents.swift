/*************************************************************************************
 Given a string S and a string T, find the minimum window in S 
 which will contain all the characters in T in complexity O(n).
 
 For example,
 S = "ADOBECODEBANC"
 T = "ABC"
 Minimum window is "BANC".
 
 Note:
 If there is no such window in S that covers all characters in T, return the empty string "".
 
 If there are multiple such windows, you are guaranteed that 
 there will always be only one unique minimum window in S.
 **************************************************************************************/

func minWindow(_ s: String, _ t: String) -> String {
//    let s = Array(s.characters)
    
    var need: [Character:Int] = [:]
    for c in t.characters {
        need[c] = (need[c] ?? 0) + 1
    }
    var head = 0
    var from = 0
    var i = 0
    var counter = t.characters.count
    var minLength = Int.max
    var fromIndex = s.startIndex
    var headIndex = fromIndex
    
    for c in s.characters {
        if let val = need[c] {
            if val > 0 {
                counter -= 1
            }
            need[c] = val - 1
        }
        i += 1
        
        while counter == 0 {
            if i - from < minLength {
                minLength = i - from
                head = from
                headIndex = fromIndex
            }
            
            let fromChar = s[fromIndex]
            if let val = need[fromChar] {
                if val == 0 {
                    counter += 1
                }
                need[fromChar] = val + 1
            }
            
            from += 1
            fromIndex = s.index(after: fromIndex)
        }
    }

    
    return minLength == Int.max ?
        "" : s[headIndex ..< s.index(headIndex, offsetBy: minLength)]
    
//    while end < s.count {
//        if need[s[end]] != nil {
//            if need[s[end]]! > 0 {
//                counter -= 1
//            }
//            need[s[end]]! -= 1
//        }
//        
//        while counter == 0 {
//            if end - begin + 1 < minLength {
//                head = begin
//                minLength = end - begin + 1
//            }
//            
//            if need[s[begin]] != nil {
//                need[s[begin]]! += 1
//                if need[s[begin]]! > 0 {
//                    counter += 1
//                }
//            }
//            begin += 1
//        }
//        
//        end += 1
//    }
    
//    return (minLength > s.count) ? "" : String(s[head ..< head + minLength])
    
}

minWindow("ADOBECODEBANC", "ABC")