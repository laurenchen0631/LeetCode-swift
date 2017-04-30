/*************************************************************************************
 Determine if a Sudoku is valid, according to
 A valid Sudoku board (partially filled) is not necessarily solvable.
 Only the filled cells need to be validated.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 **************************************************************************************/

let SUDOKU_MAX_NUMBER = 9

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    // 9 columns, 9 numbers
    var columnChecker: [[Bool]] = Array(
        repeating: Array(repeating: false, count: SUDOKU_MAX_NUMBER + 1),
        count: SUDOKU_MAX_NUMBER
    )
    
    /* 9 blocks
     -------------
     | 0 | 1 | 2 |
     -------------
     | 3 | 4 | 5 |
     -------------
     | 6 | 7 | 8 |
     -------------
    */
    var blockChecker: [[Bool]] = Array(
        repeating: Array(repeating: false, count: SUDOKU_MAX_NUMBER + 1),
        count: SUDOKU_MAX_NUMBER
    )
    
    for row in 0 ..< SUDOKU_MAX_NUMBER {
        var rowChecker: [Bool] = Array(repeating: false, count: SUDOKU_MAX_NUMBER + 1)
        for column in 0 ..< SUDOKU_MAX_NUMBER {
            // the box is filled with number not "."
            guard let num = Int(String(board[row][column])) else {
                continue
            }
            
            let block = blockIndex(row: row, column: column)
            if (
                rowChecker[num] ||
                columnChecker[column][num] ||
                blockChecker[block][num]
            ) {
                return false
            }
            
            rowChecker[num] = true
            columnChecker[column][num] = true
            blockChecker[block][num] = true
        }
    }
    
    return true
}

func blockIndex(row: Int, column: Int) -> Int {
    return (row / 3) * 3 + column / 3
}

//["..4...63.",".........","5......9.","...56....","4.3.....1","...7.....","...5.....",".........","........."]
//..4...63.
//.........
//5......9.
//...56....
//4.3.....1
//...7.....
//...5.....
//.........
//.........

