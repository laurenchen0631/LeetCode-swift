/*************************************************************************************
 Write a program to solve a Sudoku puzzle by filling the empty cells.
 
 Empty cells are indicated by the character '.'.
 
 You may assume that there will be only one unique solution.
 **************************************************************************************/

class Grid {
    private var possibleNums: Set<Int>
    private let position: (Int, Int)
    private var assumption: Int? = nil
    
    public var rowIndex: Int {
        let (row, _) = position
        return row
    }
    
    public var columnIndex: Int {
        let (_, col) = position
        return col
    }
    
    public var boxIndex: Int {
        let (row, col) = position
        return row / 3 * 3 + col / 3
    }
    
    public var num: Int {
        return self.assumption ?? possibleNums.first!
    }
    
    public var isCorrect: Bool {
        return self.assumption != nil || possibleNums.count == 1
    }
    
    init(row: Int, col: Int, content: Int) {
        position = (row, col)
        possibleNums = [content]
    }
    
    // empty grid
    init(row: Int, col: Int) {
        position = (row, col)
        possibleNums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
    
    public func makeAssumption(_ num: Int) {
        self.assumption = num
    }
    
    public func disableAssumption() {
        self.assumption = nil
    }
    
    public func reducePossibility(_ rowNums: Set<Int>, _ columNums: Set<Int>, _ boxNums: Set<Int>) -> Bool {
 
        possibleNums.subtract(rowNums)
        possibleNums.subtract(columNums)
        possibleNums.subtract(boxNums)
        
        return isCorrect
    }

    public func getPossibility() -> Set<Int> {
        return self.possibleNums
    }
    
    public func toString() -> String {
        if self.isCorrect {
            return "\(self.num)"
        }
        return self.possibleNums.sorted().description
    }
}

class Board {
    private var grids: [[Grid]] = []
    private var rows: [Set<Int>] = Array(repeating: [], count: 9) // store appeared digit by row[0...8]
    private var columns: [Set<Int>] = Array(repeating: [], count: 9) // store appeared digit by columns[0...8]
    private var boxes: [Set<Int>] = Array(repeating: [], count: 9) // store appeared digit by boxes[0...8]
    public var unupdatedPosition: [(Int, Int)] = []
    
    public init(_ board: [[Character]]) {
        for rowIndex in 0 ..< 9 {
            grids.append([])
            
            for columnIndex in 0 ..< 9 {
                let content = board[rowIndex][columnIndex]
                if content != "." {
                    let num = Int(String(content))!
                    grids[rowIndex].append(Grid(row: rowIndex, col: columnIndex, content: num))
                    rows[rowIndex].insert(num)
                    columns[columnIndex].insert(num)
                    boxes[rowIndex/3 * 3 + columnIndex / 3].insert(num)
                    unupdatedPosition.append((rowIndex, columnIndex))
                }
                else {
                    grids[rowIndex].append(Grid(row: rowIndex, col: columnIndex))
                }
            }
        }
    }
    
    // get other grids that will be affected by grid[row, col]. 20 grids in total (row + columns + box)
    public func getPeers(_ row: Int, _ column: Int) -> [(Int, Int)] {
        
        var peers: [(Int, Int)] = []
        for columnIndex in 0 ..< 9 {
            if columnIndex != column, !grids[row][columnIndex].isCorrect {
                peers.append((row, columnIndex))
            }
        }
        
        for rowIndex in 0 ..< 9 {
            if rowIndex != row, !grids[rowIndex][column].isCorrect {
                peers.append((rowIndex, column))
            }
        }
        
        for rowIndex in (row / 3) * 3 ..< (row / 3 + 1) * 3 {
            for columnIndex in (column / 3) * 3 ..< (column / 3 + 1) * 3 {
                if rowIndex != row, columnIndex != column, !grids[rowIndex][columnIndex].isCorrect {
                    peers.append((rowIndex, columnIndex))
                }
            }
        }
        
        return peers
    }
    
    // remove impossible grid.possibleNums
    public func advance() {
//        var updated: [[Bool]] = Array(repeating: Array(repeating: false, count: 9) , count: 9)
        var unupdateTmp: [(Int, Int)] = []
        
        for (row, column) in self.unupdatedPosition {
            for (rowIndex, columnIndex) in getPeers(row, column) {
                let grid = grids[rowIndex][columnIndex]
                let isAnswer = grid.reducePossibility(rows[rowIndex], columns[columnIndex], boxes[grid.boxIndex])
                
                if isAnswer {
//                    print("(\(rowIndex), \(columnIndex)) get answer: \(grid.possibleNums)")
                    rows[rowIndex].insert(grid.num)
                    columns[columnIndex].insert(grid.num)
                    boxes[grid.boxIndex].insert(grid.num)
                    
                    unupdateTmp.append((rowIndex, columnIndex))
                }
            }
        }
        
        self.unupdatedPosition = unupdateTmp
    }
    
    public func solve() {
        
        // get as much as fixed grids to reduce the total time of guess the answer
        while !self.unupdatedPosition.isEmpty {
            self.advance()
            self.describe()
        }
        
        self.backtracing()
        self.describe()
    }
    
    // guess the answer
    private func backtracing() -> Bool {
        for rowIndex in 0 ..< 9 {
            for columnIndex in 0 ..< 9 {
                let grid = grids[rowIndex][columnIndex]
                if grid.isCorrect {
                    continue
                }
                
                for num in grid.getPossibility() {
//                    print("\(grid.getPossibility().sorted()):\t guess (\(rowIndex), \(columnIndex)) is \(num)")
                    if isValid(num, inGrid: grid) {
                        grid.makeAssumption(num)
                        rows[rowIndex].insert(num)
                        columns[columnIndex].insert(num)
                        boxes[grid.boxIndex].insert(num)
                        
                        if backtracing() {
                            return true
                        }
                        else {
                            grid.disableAssumption()
                            rows[rowIndex].remove(num)
                            columns[columnIndex].remove(num)
                            boxes[grid.boxIndex].remove(num)
                        }
                    }
                }
                
                return false
            }
        }
        
        return true
    }
    
    // check the guessed answer in the grid is valid or not
    private func isValid(_ num: Int, inGrid grid: Grid) -> Bool {
        return !rows[grid.rowIndex].contains(num) &&
            !columns[grid.columnIndex].contains(num) &&
            !boxes[grid.boxIndex].contains(num)
    }
    
    public func saveTo(charArray arr: inout [[Character]]) {
        for rowIndex in 0 ..< 9 {
            for columnIndex in 0 ..< 9 {
                arr[rowIndex][columnIndex] = Character("\(grids[rowIndex][columnIndex].num)")
            }
        }
    }
    
    public func debugDescribe() {
        for rowIndex in 0 ..< 9 {
            for columnIndex in 0 ..< 9 {
                print("(\(rowIndex), \(columnIndex)): \(grids[rowIndex][columnIndex].toString())")
            }
        }
    }
    
    public func describe() {
        print("    0   1   2   3   4   5   6   7   8  ")
        print("  +---+---+---+---+---+---+---+---+---+")
        for row in 0 ..< 9 {
            var rowString = "\(row) |"
            for columns in 0 ..< 9 {
                if grids[row][columns].isCorrect {
                    rowString += " \(grids[row][columns].num) |"
                }
                else {
                    rowString += " . |"
                }
            }
            print(rowString)
            
            if row % 3 == 2 {
                print("  +---+---+---+---+---+---+---+---+---+")
            }
            else {
                print("  -------------------------------------")
            }
        }
        print("\n")
    }
    
}

func solveSudoku(_ board: inout [[Character]]) {
    let boardInst = Board(board)
//    boardInst.describe()
    boardInst.solve()
    boardInst.saveTo(charArray: &board)
}



