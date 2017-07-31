/*************************************************************************************
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete at most two transactions.
 
 Note:
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 **************************************************************************************/


// assume that we have no money, so "buy" means that we have to borrow money from others,
// we want to borrow less so that we have to make our balance as max as we can

// "sell" means we decide to sell the stock, after selling it we have "price" money
// and we have to give back the money we owed, 
// so we have price - |buy| = price + buy, we want to make this max.
func maxProfit(_ prices: [Int]) -> Int {
    var buyFirst = Int.min
    var sellFirst = 0
    var buySecond = Int.min
    var sellSecond = 0
    
    for price in prices {
        buyFirst = max(buyFirst, -price)
        sellFirst = max(sellFirst, price + buyFirst)
        
        buySecond = max(buySecond, sellFirst - price)
        sellSecond = max(sellSecond, price + buySecond )
//        print(buyFirst, sellFirst, buySecond, sellSecond, separator: ", ", terminator: "\n")
    }
    
    return sellSecond
}

maxProfit([7, 1, 5, 3, 6, 4])