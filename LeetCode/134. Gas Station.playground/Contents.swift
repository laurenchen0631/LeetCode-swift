/*************************************************************************************
 There are N gas stations along a circular route, where the amount of gas at station i is gas[i].
 
 You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.
 
 Return the starting gas station's index if you can travel around the circuit once, otherwise return -1.
 
 Note:
 The solution is guaranteed to be unique.
 **************************************************************************************/

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var startIndex = gas.count - 1
    var endIndex = 0
    
    var remainedGas = gas[startIndex] - cost[startIndex]
    while endIndex < startIndex {
        if remainedGas >= 0 {
            remainedGas += (gas[endIndex] - cost[endIndex])
            endIndex += 1
        }
        else {
            startIndex -= 1
            remainedGas += (gas[startIndex] - cost[startIndex])
        }
    }
    
    return remainedGas >= 0 ? startIndex : -1
}