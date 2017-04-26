/*************************************************************************************
 Divide two integers without using multiplication, division and mod operator.
 
 If it is overflow, return MAX_INT.
 **************************************************************************************/

let INT_MIN_C = -2147483648
let INT_MAX_C = 2147483647

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    
    // make sure divisor isn't 0
    guard divisor != 0 else {
        return INT_MAX_C
    }
    
    // special case for C: only one possible that the result is overflow, INT_MIN_C / -1 > INT_MAX_C
    if divisor == -1 && dividend == INT_MIN_C {
        return INT_MAX_C
    }
    
    var remain = abs(dividend)
    let positiveDivisor = abs(divisor)
    
    var quotient = 0
    while remain >= positiveDivisor {
        
        // use the bitwise operation to speed up
        // 27 / 2
        // 27 - 2, 27 - 4, 27 - 8, ** 27 - 16 ** , 27 - 32 < 0, quotient is 8 for now
        // 11 - 2, 11 - 4, ** 11 - 8 **, quotient is 8 + 4 for now
        // ** 3 - 2 **, quotient is 8 + 4 + 1  for now
        // 1 < 2, quotient = 8 + 4 + 1 = 13

        var dvs = positiveDivisor
        var multiple = 1

        while (dvs << 1) < remain {
            dvs <<= 1
            multiple <<= 1
        }
        quotient += multiple
        remain -= dvs
    }
    
    // in some negative divide, 5 / -2 = -3...1     4 / -2 = -2
//    if isNegativeDivide(dividend: dividend, divisor: divisor) {
//        return -(times + (remain > 0 ? 1 : 0))
//    }

    return isNegativeDivide(dividend: dividend, divisor: divisor) ? -quotient : quotient
    
}

func isNegativeDivide(dividend: Int, divisor: Int) -> Bool {
    return (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
}
