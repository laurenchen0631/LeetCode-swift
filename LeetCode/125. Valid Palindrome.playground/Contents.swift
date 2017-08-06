/*************************************************************************************
 WGiven a string, determine if it is a palindrome,
 considering only alphanumeric characters and ignoring cases.
 
 For example,
 "A man, a plan, a canal: Panama" is a palindrome.
 "race a car" is not a palindrome.
 
 Note:
 Have you consider that the string might be empty? 
 This is a good question to ask during an interview.
 
 For the purpose of this problem, we define empty string as valid palindrome.
 **************************************************************************************/

import Foundation

func isPalindrome(_ s: String) -> Bool {
    let strArray = Array(s.uppercased().unicodeScalars)
    var lo = 0
    var hi = strArray.count - 1
    
    while lo <= hi {
        while lo < hi, !isAlphanumeric(strArray[lo]) {
            lo += 1
        }
        while lo < hi, !isAlphanumeric(strArray[hi]) {
            hi -= 1
        }
        
        if strArray[lo] != strArray[hi] {
            return false
        }
        lo += 1
        hi -= 1
    }
    
    return true
}

func isAlphanumeric(_ c: UnicodeScalar) -> Bool {
    return CharacterSet.alphanumerics.contains(c)
}

isPalindrome("[]]]")