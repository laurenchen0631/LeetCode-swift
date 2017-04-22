/******************************************************************
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 ********************************************************************/

func generateParenthesis(_ n: Int) -> [String] {
    var combinations: [String] = []
    generateOneByOne(sublist: "", numLeftBracket: n, numRightBracket: n, result: &combinations)
    
    return combinations
}

func generateOneByOne(
    sublist: String,
    numLeftBracket left: Int,
    numRightBracket right: Int,
    result: inout [String]
) {
    // right parentheses can't be more than left parentheses
    if left > right {
        return
    }
    
    if left > 0 {
        generateOneByOne(
            sublist: sublist + "(",
            numLeftBracket: left - 1,
            numRightBracket: right,
            result: &result
        )
    }
    
    if right > 0 {
        generateOneByOne(
            sublist: sublist + ")",
            numLeftBracket: left,
            numRightBracket: right - 1,
            result: &result
        )
    }
    
    if left == 0, right == 0 {
        result.insert(sublist, at: 0)
        return
    }
}

generateParenthesis(4)
