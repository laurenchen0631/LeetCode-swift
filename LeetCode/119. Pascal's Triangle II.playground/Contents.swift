/*************************************************************************************
 Given an index k, return the kth row of the Pascal's triangle.
 
 For example, given k = 3,
 Return [1,3,3,1].
 
 Note:
 Could you optimize your algorithm to use only O(k) extra space?
 **************************************************************************************/

func getRow(_ rowIndex: Int) -> [Int] {
    var row: [Int] = [1]
    for _ in stride(from: 0, to: rowIndex, by: 1) {
        var tmp: [Int] = []
        for (a, b) in zip([0] + row, row + [0]) {
            tmp.append(a+b)
        }
        row = tmp
    }
    
    return row
}

getRow(2)