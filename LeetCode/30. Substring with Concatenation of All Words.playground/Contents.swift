/*************************************************************************************
 WYou are given a string, s, and a list of words, words, that are all of the same length. 
 Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once 
 and without any intervening characters.
 
 For example, given:
 s: "barfoothefoobarman"
 words: ["foo", "bar"]
 
 You should return the indices: [0,9].
 (order does not matter).
 **************************************************************************************/


// time complexity: O(MN), N is the length of string, M is the number of words
func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    
    
    guard s != "", words.count > 0 else {
        return []
    }
    
    let strLength = s.characters.count
    let wordLength = words.first!.characters.count
    let numWords = words.count
    
    if strLength < numWords * wordLength {
        return []
    }
    
    var substringIndexes: [Int] = [] // output

    // store the ocuurence of the word for efficiency
    var wordDict: [String : Int] = [:]
    words.forEach { (word) in
        wordDict[word] = (wordDict[word] ?? 0) + 1
    }
    
    for index in 0...strLength - numWords * wordLength {
        // prevent the occurence of word is more than input word
        var seen: [String : Int] = [:]
        
        // from index check every the str which has the length of wordLength
        // if every word from input has been matched, it will be a index to output
        var wordCount = 0
        while wordCount < numWords {
            let leftIndex = s.index(s.startIndex, offsetBy: index + wordCount * wordLength)
            let rightIndex = s.index(leftIndex, offsetBy: wordLength)
            
            let checkedWord = s[leftIndex..<rightIndex]
            if wordDict[checkedWord] != nil {
                seen[checkedWord] = (seen[checkedWord] ?? 0) + 1
                
                if seen[checkedWord]! > wordDict[checkedWord]! {
                    break
                }
            }
            else {
                break
            }
            
            wordCount += 1
        }
        
        if wordCount == numWords {
            substringIndexes.append(index)
        }
        
    }
    
    return substringIndexes
}

func findSubstringN(_ s: String, _ words: [String]) -> [Int] {
    guard s != "", words.count > 0 else {
        return []
    }
    
    let strLength = s.characters.count
    let wordLength = words.first!.characters.count
    let numWords = words.count
    
    if strLength < numWords * wordLength {
        return []
    }
    
    // store the ocuurence of the word for efficiency
    var wordDict: [String : Int] = [:]
    words.forEach { (word) in
        wordDict[word] = (wordDict[word] ?? 0) + 1
    }
    
    var substringIndexes: [Int] = [] // output
    // travel all sub string combinations
    for i in 0 ..< wordLength {
        var left = i
        var count = 0
        
        var seen: [String : Int] = [:]
        var j = i
        while j <= strLength - wordLength {
            let checkedWord = substr(s, from: j, length: wordLength)

            // a valid word, accumulate results
            if wordDict[checkedWord] != nil {
                seen[checkedWord] = (seen[checkedWord] ?? 0) + 1
                count += 1
                
                if seen[checkedWord]! > wordDict[checkedWord]! {
                    // a more word, advance the window left side possiablly
                    while seen[checkedWord]! > wordDict[checkedWord]! {
                        let leftWord = substr(s, from: left, length: wordLength)
                        seen[leftWord]! -= 1
                        count -= 1
                        left += wordLength
                    }
                }
                
                if count == numWords {
                    substringIndexes.append(left)
                    // advance one word
                    let leftWord = substr(s, from: left, length: wordLength)
                    seen[leftWord]! -= 1
                    count -= 1
                    left += wordLength
                }
            }
            // not a valid word, reset all vars
            else {
                seen.removeAll()
                count = 0
                left = j + wordLength
            }
            
            j += wordLength
        }
        
    }
    
    return substringIndexes
}

func substr(_ s: String, from start: Int, length len: Int) -> String {
    let leftIndex = s.index(s.startIndex, offsetBy: start)
    let rightIndex = s.index(leftIndex, offsetBy: len)
    
    return s[leftIndex ..< rightIndex]
}

findSubstringN("foobarbarfoobar", ["foo", "bar"])