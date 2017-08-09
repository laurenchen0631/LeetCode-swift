/*************************************************************************************
 Given two words (beginWord and endWord), and a dictionary's word list, 
 find all shortest transformation sequence(s) from beginWord to endWord, such that:
 
 Only one letter can be changed at a time
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 For example,
 
 Given:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log","cog"]
 
 Return
 [
    ["hit","hot","dot","dog","cog"],
    ["hit","hot","lot","log","cog"]
 ]
 
 Note:
 Return an empty list if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 
 **************************************************************************************/

// two-end BFS
func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
    if wordList.index(of: endWord) == nil {
        return []
    }
    
    // hash set for both ends
    let startSet: Set<String> = [beginWord]
    let endSet: Set<String> = [endWord]
    
    // we use a map to help construct the final result
    var map: [String : [String]] = [:]
    var wordListSet = Set(wordList)
    
    // build the map
    // ["log": ["cog"], "hit": ["hot"], "dog": ["cog"], "lot": ["log"], "dot": ["dog"], "hot": ["lot", "dot"]]
    helper(wordList: &wordListSet, setA: startSet, setB: endSet, output: &map, flip: false)
    
    var res: [[String]] = []
    var path = [beginWord]
    
    // recursively build the final result
    generateList(start: beginWord, end: endWord, map: map, path: &path, output: &res)
    
    return res
}

let charList: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

func helper(
    wordList: inout Set<String>,
    setA: Set<String>,
    setB: Set<String>,
    output map: inout [String : [String]],
    flip: Bool
    ) {
    if setA.isEmpty {
        return
    }
    
    if setA.count < setB.count {
        helper(wordList: &wordList, setA: setB, setB: setA, output: &map, flip: !flip)
        return
    }
    
    // remove words on current both ends from the dict
    wordList.subtract(setA.union(setB))
    print(wordList)
    
    // done flag will be true, when we find the shortest path
    var done = false;
    
    // set for transformable words from setA
    var set: Set<String> = []
    
    // for each string in end 1
    for word in setA {
        for i in 0 ..< word.characters.count {
            var chars: [Character] = Array(word.characters)
            
            // change one character for every position
            for ch in charList {
                chars[i] = ch
                let transformedWord = String(chars)
                
                // make sure we construct the tree in the correct direction
                let key = flip ? transformedWord : word;
                let val = flip ? word : transformedWord;
                
                var list: [String] = map[key] ?? []
                
                if setB.contains(transformedWord) {
                    done = true
                    
                    list.append(val)
                    map[key] = list
                }
                
                if !done, wordList.contains(transformedWord) {
                    set.insert(transformedWord)
                    
                    list.append(val)
                    map[key] = list
                }
                
            }
        }
    }
    
    // early terminate if done is true
    if done {
        return
    }
    else {
        helper(wordList: &wordList, setA: setB, setB: set, output: &map, flip: !flip)
    }
}


func generateList(
    start: String,
    end: String,
    map: [String : [String]],
    path: inout [String],
    output res: inout [[String]]
) {
    if (start == end) {
        res.append(path)
        return
    }
    
    // need this check in case the diff between start and end happens to be one
    // e.g "a", "c", {"a", "b", "c"}
    guard let transformableWords = map[start] else {
        return;
    }
    
    for word in transformableWords {
        path.append(word)
        generateList(start: word, end: end, map: map, path: &path, output: &res)
        path.popLast()
    }
}

findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"])