/*************************************************************************************
 Implement pow(x, n).
 **************************************************************************************/

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    
    // 2^8 = 4^4 = 16^2 = 256^1
    // 2^7 = 2 * 2^6 = 2 * 4^3 = (2 * 4) * 16^1
    var result: Double = 1
    var power = abs(n)
    var base = x
    
    while 1 < power {
        if power % 2 == 1 {
            result *= base
        }
        base *= base
        power /= 2
    }
    
    if n < 0 {
        return 1 / (result * base)
    }
    return result * base
}

myPow(5, 3)
myPow(1.2, 2)
myPow(3, -2)