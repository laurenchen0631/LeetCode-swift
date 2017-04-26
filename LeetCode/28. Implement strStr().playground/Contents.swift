/*************************************************************************************
 Implement strStr().
 
 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 **************************************************************************************/

func strStr(_ haystack: String, _ needle: String) -> Int {
    
    // when the fisrt character of niddle is found in haystack, start count the number of matched characters
    // once the character isn't matched, recount from 0
    // if the number of matched characters equals to the lengtg of niddle, return the index
    
    // strStr("sunofsunnyday", "sunny")
    let needleLength = needle.characters.count
    guard needleLength > 0 else {
        return 0
    }
    
    let needleArray = Array(needle.characters)
    let hayStackArray = Array(haystack.characters)
    var needleIndex = 0
    
    guard hayStackArray.count >= needleLength else {
        return -1
    }
    
    for index in 0 ... hayStackArray.count - needleLength {
        var matched = true
        for needleIndex in 0 ..< needleLength {
            if hayStackArray[index + needleIndex] != needleArray[needleIndex] {
                matched = false
                break
            }
        }
        if matched {
            return index
        }
    }
    
    return -1
}

strStr("bcda", "a")