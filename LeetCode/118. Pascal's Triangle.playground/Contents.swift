/*************************************************************************************
 Given numRows, generate the first numRows of Pascal's triangle.
 
 For example, given numRows = 5,
 Return
 
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 **************************************************************************************/

func generate(_ numRows: Int) -> [[Int]] {
    if numRows == 0 {
        return []
    }
    
    var pascalTriangle = [[1]]
    for num in stride(from: 0, to: numRows - 1, by: 1) {
        var row: [Int] = []
        for (a, b) in zip([0] + pascalTriangle.last!, pascalTriangle.last! + [0]) {
            row.append(a + b)
        }
        pascalTriangle.append(row)
    }
    
    return pascalTriangle
}

generate(1)