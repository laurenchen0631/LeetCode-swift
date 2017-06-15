import Foundation
/*************************************************************************************
 Given a string s1, we may represent it as a binary tree 
 by partitioning it to two non-empty substrings recursively.
 
 Below is one possible representation of s1 = "great":
 
        great
       /    \
      gr    eat
     / \    /  \
    g   r  e   at
   / \
  a   t
 To scramble the string, we may choose any non-leaf node and swap its two children.
 
 For example, if we choose the node "gr" and swap its two children, it produces a scrambled string "rgeat".
 
       rgeat
      /    \
     rg    eat
    / \    /  \
   r   g  e   at
  / \
 a   t
 We say that "rgeat" is a scrambled string of "great".
 
 Similarly, if we continue to swap the children of nodes "eat" and "at", it produces a scrambled string "rgtae".
 
       rgtae
      /    \
     rg    tae
    / \    /  \
   r   g  ta  e
  / \
 t   a
 We say that "rgtae" is a scrambled string of "great".
 
 Given two strings s1 and s2 of the same length, determine if s2 is a scrambled string of s1.
 **************************************************************************************/

func isScramble(_ s1: String, _ s2: String) -> Bool {
    if s1 == s2 {
        return true
    }
    
    if !isPermute(s1, s2) {
        return false
    }
    
    var s1Index = s1.index(after: s1.startIndex)
    var s2Index = s2.index(after: s2.startIndex)
    // try subtree from length 1 to len(s) - 1
    for i in 1 ..< s1.characters.count {
        if (isScramble(s1.substring(to: s1Index), s2.substring(to: s2Index)) &&
            isScramble(s1.substring(from: s1Index), s2.substring(from: s2Index))) {
            return true
        }
        
        
        // check s2 is swap or not
        let s2ReverseIndex = s2.index(s2.endIndex, offsetBy: -i)
        if (isScramble(s1.substring(to: s1Index), s2.substring(from: s2ReverseIndex)) &&
            isScramble(s1.substring(from: s1Index), s2.substring(to: s2ReverseIndex))) {
            return true
        }
        
        s1Index = s1.index(after: s1Index)
        s2Index = s2.index(after: s2Index)
    }
    return false
}

func isPermute(_ s1: String, _ s2: String) -> Bool {
    let s1 = Array(s1.characters)
    let s2 = Array(s2.characters)
    
    if s1.count != s2.count {
        return false
    }
    
    var dict: [Character: Int] = [:]
    for i in 0 ..< s1.count {
        dict[s1[i]] = (dict[s1[i]] ?? 0) + 1
        dict[s2[i]] = (dict[s2[i]] ?? 0) - 1
    }
    
    for kv in dict {
        if kv.value != 0 {
            return false
        }
    }
    return true
}

isPermute("gr", "rg")
isScramble("great", "rgeat")