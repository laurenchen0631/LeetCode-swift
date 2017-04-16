/********************************************************************
  find the longest common prefix string amongst an array of strings.
 ********************************************************************/


func longestCommonPrefix(_ strs: [String]) -> String {
    
    // if no other comparable string
    if strs.count < 2 {
       return strs.first ?? ""
    }
    
    // sort the string array
    // compare the first one and the last one
    let sortedStrs = strs.sorted()
    var commonPrefix = ""
    var comparedString = sortedStrs.last!.characters.makeIterator()

    for c in sortedStrs.first!.characters {
        if c == comparedString.next() {
            commonPrefix.append(c)
        }
        else {
            break
        }
    }
    
    return commonPrefix
}

longestCommonPrefix(["abcdw", "abcfqwwewq17", "abc31"])