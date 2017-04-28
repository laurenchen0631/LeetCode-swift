/*************************************************************************************
 Given a string containing just the characters '(' and ')', 
 find the length of the longest valid (well-formed) parentheses substring.
 
 For "(()", the longest valid parentheses substring is "()", which has length = 2.
 
 Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
 **************************************************************************************/

/*
 ((( ((()))()()  -> ((()))()()   [0 1 2]
 () ))))( ()()()() ( -> [2 3 4 5 6]
 (()()()) )) ((((()())))) )) -> [8 9 22 23]
 
 () ))) (()) ( () ( () ( () (( ((())(()()()())) ((
 
 
 */
func longestValidParentheses(_ s: String) -> Int {
    var stack: [Int] = []
    var longest = 0
    
    
    // store the index of unmatched parentheses to the stack
    // the span between the unmatched is the valid parentheses
    for (i, c) in s.characters.enumerated() {
        print(stack)
        if c == Character(")") {
            guard let prevIndex = stack.last else {
                stack.append(i)
                continue
            }
            
            if s[s.index(s.startIndex, offsetBy: prevIndex)] == Character("(") {
                stack.popLast()
                longest = max(longest, i - (stack.last ?? -1))
            }
            else {
                stack.append(i)
            }
            
            
        }
        else {
            stack.append(i)
        }
    }
    
    return longest
}

//longestValidParentheses("(((((()))()()")
//longestValidParentheses("()))))(()()()()(")
//longestValidParentheses("(()")
