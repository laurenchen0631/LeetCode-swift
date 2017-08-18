/*************************************************************************************
 There are N children standing in a line. Each child is assigned a rating value.
 
 You are giving candies to these children subjected to the following requirements:
 
 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 What is the minimum candies you must give?
 **************************************************************************************/

func candy(_ ratings: [Int]) -> Int {
    
    var candies = Array(repeating: 1, count: ratings.count)
    
    // Scan from left to right, to make sure right higher rated child gets 1 more candy than left lower rated child
    for i in stride(from: 1, through: candies.count - 1, by: 1) {
        if ratings[i - 1] < ratings[i] {
            candies[i] = candies[i - 1] + 1
        }
    }
    
    // Scan from right to left, to make sure left higher rated child gets 1 more candy than right lower rated child
    for i in stride(from: candies.count - 2, through: 0, by: -1) {
        if ratings[i] > ratings[i + 1] {
            candies[i] = max(candies[i], candies[i + 1] + 1)
        }
    }
    
    return candies.reduce(0, +)
}

candy([1, 2, 3, 4,4,3,2,1])