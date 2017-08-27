/*************************************************************************************
 Given an array of integers, every element appears three times except for one, 
 which appears exactly once. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 **************************************************************************************/

func singleNumber(_ nums: [Int]) -> Int {
    // we need to implement a tree-time counter(base 3) that if a bit appears three time ,it will be zero.
    // curent  income  ouput
    //  ab      c/c       ab/ab
    //  00      1/0       01/00
    //  01      1/0       10/01
    //  10      1/0       00/10
    // a=~abc+a~b~c;
    // b=~a~bc+~ab~c;
    
    var a = 0
    var b = 0
    for num in nums {
        let tempA = (~a & b & num) + (a & ~b & ~num)
        b = (~a & ~b & num) + (~a & b & ~num)
        a = tempA
    }
    
    return a | b
}
singleNumber([3,3,2,2,3])
