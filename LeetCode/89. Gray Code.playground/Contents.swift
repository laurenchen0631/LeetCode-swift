/*************************************************************************************
 The gray code is a binary numeral system where two successive values differ in only one bit.
 
 Given a non-negative integer n representing the total number of bits in the code, 
 print the sequence of gray code. A gray code sequence must begin with 0.
 
 For example, given n = 2, return [0,1,3,2]. Its gray code sequence is:
 
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 **************************************************************************************/

// level       1        2              3                4
//          (0, 1), (11, 10), (110, 111, 101, 100), (1100, ....)
//          (0, 1),   (3, 2),   (6, 7, 5, 4)
func grayCode(_ n: Int) -> [Int] {
    var grayCodeValues: [Int] = [0]
    for level in 0 ..< n {
        var tmp: [Int] = []
        let grayCodeStep = 1 << level
        for grayCodeVal in grayCodeValues.reversed() {
            tmp.append(grayCodeVal + grayCodeStep)
        }Ø
        grayCodeValues.append(contentsOf: tmp)
    }
    
    return grayCodeValues
}

grayCode(3)