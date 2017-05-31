/*************************************************************************************
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 **************************************************************************************/

func climbStairs(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var twoStairsBefore = 1
    var oneStairsBefore = 2
    for _ in 3 ... n {
        let sum = twoStairsBefore + oneStairsBefore
        twoStairsBefore = oneStairsBefore
        oneStairsBefore = sum
    }
    return oneStairsBefore
}

climbStairs(4)