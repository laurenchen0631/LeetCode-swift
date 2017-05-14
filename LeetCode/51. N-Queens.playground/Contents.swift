/*************************************************************************************
 The n-queens puzzle is the problem of placing n queens 
 on an n×n chessboard such that no two queens attack each other.
 
 Given an integer n, return all distinct solutions to the n-queens puzzle.
 
 Each solution contains a distinct board configuration of the n-queens' placement, 
 where 'Q' and '.' both indicate a queen and an empty space respectively.
 
 For example,
 There exist two distinct solutions to the 4-queens puzzle:
 **************************************************************************************/

// (0,0) (0,1) (0,2)
// (1,0) (1,1) (1,2)
// (2,0) (2,1) (2,2)

// we found that (1,1), (0,2), (2,0) (p,q) cause p + q = 2
// we found that (1,1), (0,0), (2,2) (p,q) cause p - q = 0
func solveNQueens(_ n: Int) -> [[String]] {
    var results: [[(Int, Int)]] = []
    placeQueen(
        row: 0, size: n,
        posCol: [:], posSum: [:], posDiff: [:],
        queens: [], output: &results
    )
    
    return boards(results: results, size: n)
}

func placeQueen(
    row level:Int, size n: Int,
    posCol colDict: [Int:Bool], posSum sumDict: [Int:Bool], posDiff diffDict: [Int:Bool],
    queens: [(Int, Int)], output results: inout [[(Int, Int)]]
    ) {
    for col in 0 ..< n {
        if colDict[col] != nil || sumDict[level + col] != nil || diffDict[level - col] != nil {
            continue
        }

        var queens = queens + [(level, col)]
        if level == n - 1 {
            results.append(queens)
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
            queens: queens, output: &results
        )
        
    }
}

func boards(results: [[(Int, Int)]], size n: Int) -> [[String]] {
    var boards: [[String]] = []
    for queens in results {
        var board: [String] = []
        for row in 0 ..< n {
            var boardRow = ""
            let (_, queenCol) = queens[row]
            for col in 0 ..< n {
                if col != queenCol {
                    boardRow.append(".")
                }
                else {
                    boardRow.append("Q")
                }
            }
            board.append(boardRow)
        }
        boards.append(board)
    }
    
    return boards
}

print(solveNQueens(4))
