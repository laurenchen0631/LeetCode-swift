/*************************************************************************************
 Follow up for 51. N-Queens problem.
 
 Now, instead outputting board configurations, 
 return the total number of distinct solutions.
 **************************************************************************************/

func totalNQueens(_ n: Int) -> Int {
    var results: Int = 0
    placeQueen(
        row: 0, size: n,
        posCol: [:], posSum: [:], posDiff: [:],
        output: &results
    )
    
    return results
}


func placeQueen(
    row level:Int, size n: Int,
    posCol colDict: [Int:Bool], posSum sumDict: [Int:Bool], posDiff diffDict: [Int:Bool],
    output results: inout Int
    ) {
    for col in 0 ..< n {
        if colDict[col] != nil || sumDict[level + col] != nil || diffDict[level - col] != nil {
            continue
        }
        
        if level == n - 1 {
            results += 1
            return
        }
        
        var colDict = colDict
        var sumDict = sumDict
        var diffDict = diffDict
        colDict[col] = true
        sumDict[level + col] = true
        diffDict[level - col] = true
        placeQueen(
            row: level + 1, size: n,
            posCol: colDict, posSum: sumDict, posDiff: diffDict,
            output: &results
        )
        
    }
}

print(totalNQueens(4))
