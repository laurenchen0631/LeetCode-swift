/*************************************************************************************
 Validate if a given string is numeric.
 
 Some examples:
 "0" => true
 " 0.1 " => true
 "abc" => false
 "1 a" => false
 "2e10" => true
 
 **************************************************************************************/

func isNumber(_ s: String) -> Bool {
    var index: String.Index = s.startIndex
    while index < s.endIndex, s[index] == Character(" ") {
        index = s.index(after: index)
    }
    let startIndex = index
    
    var hasNum = false
    var hasPoint = false
    var hasPointNum = false
    var hasExponent = false
    var hasExponentNum = false
    while index < s.endIndex, s[index] != Character(" ") {
        let c = s[index]
        
        if Character("0") <= c, c <= Character("9") {
            if hasExponent {
                hasExponentNum = true
            }
            else if hasPoint {
                hasPointNum = true
            }
            else {
                hasNum = true
            }
        }
        else if c == Character("e") || c == Character("E") {
            if hasExponent {
                return false
            }
            else if (!hasNum && !hasPointNum) {
                return false
            }
            hasExponent = true
        }
        else if c == Character(".") {
            if hasPoint || hasExponent {
                return false
            }
            hasPoint = true
        }
        else if c == Character("+") || c == Character("-") {
            if (
                index != startIndex &&
                s[s.index(before: index)] != Character("e") &&
                s[s.index(before: index)] != Character("E")
                ) {
                return false
            }
        }
        else {
            return false
        }
        index = s.index(after: index)
    }
    
    while index < s.endIndex {
        if s[index] != Character(" ") {
            return false
        }
        index = s.index(after: index)
    }
    
    return (hasExponentNum || (!hasExponent && (hasNum || hasPointNum)))
    
}

//isNumber("3e")
isNumber("3e-2")
isNumber("3.134")
isNumber("3.")
isNumber("3.e-31")
isNumber("6ee69")
