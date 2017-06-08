/*************************************************************************************
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, 
 where "adjacent" cells are those horizontally or vertically neighboring. 
 The same letter cell may not be used more than once.
 
 For example,
 Given board =
 
 [
 ["A","B","C","E"],
 ["S","F","C","S"],
 ["A","D","E","E"]
 ]
 word = "ABCCED", -> returns true,
 word = "SEE", -> returns true,
 word = "ABCB", -> returns false.
 **************************************************************************************/

func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard word != "" else {
        return false
    }
    
    var board = board
    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    for row in 0 ..< board.count {
        for col in 0 ..< board[row].count {
            if exist(&board, row: row, col: col, word: word, wordIndex: word.startIndex, visited: &visited) {
                return true
            }
        }
    }
    return false
}

func exist(
    _ board: inout [[Character]],
    row y: Int,
    col x: Int,
    word: String,
    wordIndex index: String.Index,
    visited: inout [[Bool]]
    ) -> Bool {
    
    if index == word.endIndex {
        return true
    }
    if (
        y < 0 ||
        y >= board.count ||
        x < 0 ||
        x >= board[y].count ||
        visited[y][x] ||
        word[index] != board[y][x]
    ) {
        return false
    }

    
    let nextIndex = word.index(after: index)
    visited[y][x] = true
    let existed = (
        exist(&board, row: y-1, col: x, word: word, wordIndex: nextIndex, visited: &visited) ||
        exist(&board, row: y+1, col: x, word: word, wordIndex: nextIndex, visited: &visited) ||
        exist(&board, row: y, col: x - 1, word: word, wordIndex: nextIndex, visited: &visited) ||
        exist(&board, row: y, col: x+1, word: word, wordIndex: nextIndex, visited: &visited)
    )
    visited[y][x] = false
    return existed
}

var board: [[Character]] =  [
    ["A","B","C","E"],
    ["S","F","C","S"],
    ["A","D","E","E"]
]

exist(board, "AB")
exist(board, "SEE")
exist(board, "ABCB")