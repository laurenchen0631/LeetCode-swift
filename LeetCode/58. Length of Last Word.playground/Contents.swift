/*************************************************************************************
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ',
 return the length of last word in the string.
 
 If the last word does not exist, return 0.
 
 Note: A word is defined as a character sequence consists of non-space characters only.
 
 For example,
 Given s = "Hello World",
 return 5.
 **************************************************************************************/

func lengthOfLastWord(_ s: String) -> Int {
    var length = 0
    var chars = Array(s.characters)
    var tailIndex = chars.count - 1
    
    // skip tail space
    while tailIndex >= 0, chars[tailIndex] == Character(" ") {
        tailIndex -= 1
    }
    
    while tailIndex >= 0, chars[tailIndex] != Character(" ") {
        tailIndex -= 1
        length += 1
    }
    
    return length
}

lengthOfLastWord("")