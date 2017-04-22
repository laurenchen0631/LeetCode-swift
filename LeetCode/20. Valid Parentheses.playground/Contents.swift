/******************************************************************
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 ********************************************************************/


func isValid(_ s: String) -> Bool {
    var bracketsStack: [Character] = []
    
    for bracket in s.characters {
        switch String(bracket) {
        
        case ")":
            if bracketsStack.popLast() != Character("(") {
                return false
            }

        case "}":
            if bracketsStack.popLast() != Character("{") {
                return false
            }
            
        case "]":
            if bracketsStack.popLast() != Character("[") {
                return false
            }
        
        default:
            bracketsStack.append(bracket)
        }
    }
    
    return bracketsStack.isEmpty
}