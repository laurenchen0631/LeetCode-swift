/*************************************************************************************
 Given a string s, partition s such that every substring of the partition is a palindrome.
 
 Return all possible palindrome partitioning of s.
 
 For example, given s = "aab",
 Return
 
 [
 ["aa","b"],
 ["a","a","b"]
 ]
 **************************************************************************************/

func partition(_ s: String) -> [[String]] {
    var res: [[String]] = []
    if s.isEmpty {
        return res
    }
    
    var path: [String] = []
    dfs(s, path: &path, output: &res)
    return res
}

func dfs(_ str: String, path: inout [String], output res: inout [[String]]) {
    if str.isEmpty {
        res.append(path)
        return
    }
    
    var index = str.startIndex
    for _ in 0 ..< str.characters.count {
        let substr = str[str.startIndex ... index]
        index = str.index(after: index)
        
        if isPartition(substr) {
            path.append(substr)
            dfs(str[index ..< str.endIndex], path: &path, output: &res)
            path.popLast()
        }
    }
//    if start == str.endIndex {
//        res.append(path)
//        return
//    }
    
//    var index = start
//    for _ in 0 ..< str[start ..< str.endIndex].characters.count {
//        let substr = str[start ... index]
//        index = str.index(after: index)
//        
//        if isPartition(substr) {
//            path.append(substr)
//            dfs(str, fromIndex: index, path: &path, output: &res)
//            path.popLast()
//        }
//
//    }
}

func isPartition(_ s: String) -> Bool {
    return s == String(s.characters.reversed())
}

partition("ltsqjodzeriqdtyewsrpfscozbyrpidadvsmlylqrviuqiynbscgmhulkvdzdicgdwvquigoepiwxjlydogpxdahyfhdnljshgjeprsvgctgnfgqtnfsqizonirdtcvblehcwbzedsmrxtjsipkyxk")