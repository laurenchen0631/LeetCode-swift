/*************************************************************************************
 Given an array of strings, group anagrams together.
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Return:
 
 [
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 Note: All inputs will be in lower-case.
 **************************************************************************************/

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagrams: [String: [String]] = [:]
    for word in strs {
        let chars = Array(word.characters.sorted())
        let key = String(chars)
        if anagrams[key] != nil {
            anagrams[key]!.append(word)
        }
        else {
            anagrams[key] = [word]
        }
    }
    
    return Array(anagrams.values)
}

groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])