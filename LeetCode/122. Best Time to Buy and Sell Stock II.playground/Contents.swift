/*************************************************************************************
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. 
 You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). 
 However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 **************************************************************************************/

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {
        return 0
    }
    
    var profit = 0
    for i in 0 ..< prices.count - 1 {
        if prices[i] < prices[i + 1] {
            profit += (prices[i+1] - prices[i])
        }
    }
    
    return profit
}

maxProfit([1])