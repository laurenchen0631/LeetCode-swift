/*************************************************************************************
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 **************************************************************************************/

func addBinary(_ a: String, _ b: String) -> String {
    var aIndex: String.Index? = a.index(before: a.endIndex)
    var bIndex: String.Index? = b.index(before: b.endIndex)
//    var digitsA = Array(a.characters)
//    var digitsB = Array(b.characters)
//    var aIndex = digitsA.count - 1
//    var bIndex = digitsB.count - 1
//    
//    var carry = false
//    var digits: [Character] = []
//    
//    
//    while aIndex >= 0 || bIndex >= 0 || carry {
//        let digitA: Character = aIndex >= 0 ? digitsA[aIndex] : "0"
//        let digitB: Character = bIndex >= 0 ? digitsB[bIndex] : "0"
//        let digit: Character
//        (carry, digit) = addSingleBinary(digitA, digitB, carry: carry)
//        digits.append(digit)
//        
//        aIndex -= 1
//        bIndex -= 1
//    }
    
    while aIndex != nil || bIndex != nil || carry {
        let digitA: Character = aIndex != nil ? a[aIndex!] : "0"
        let digitB: Character = bIndex != nil ? b[bIndex!] : "0"
        let digit: Character
        (carry, digit) = addSingleBinary(digitA, digitB, carry: carry)
        digits.append(digit)
        
        
        if aIndex != nil {
            if aIndex == a.startIndex {
                aIndex = nil
            }
            else {
                aIndex = a.index(before: aIndex!)
            }
        }
        if bIndex != nil {
            if bIndex == b.startIndex {
                bIndex = nil
            }
            else {
                bIndex = b.index(before: bIndex!)
            }
        }
    }
    
    
    return String(digits.reversed())
}

func addSingleBinary(_ a: Character, _ b: Character, carry: Bool) -> (Bool, Character) {
    if a != b {
        if carry {
            return (true, "0")
        }
        else {
            return (false, "1")
        }
    }
    else if a == Character("0") {
        return (false, carry ? "1" : "0")
    }
    else {
        return (true, carry ? "1" : "0")
    }
}

addBinary("101", "11111")